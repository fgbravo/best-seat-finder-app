# frozen_string_literal: true

class BestSeatPicker
  def initialize(venue, seats, requested_seats)
    @venue = venue
    @seats = seats
    @requested_seats = requested_seats
  end

  def find
    ordered_seats = @seats.sort_by { |seat| [seat.row, seat.column] }

    selected_row = ordered_seats.group_by(&:row).find { |_group, row| sequential_available_seats_for_row(row) }

    raise BestSeatPickers::NoAvailableSeatsError if selected_row.nil?

    possible_sets = possible_sets(selected_row.last)

    select_best_set(possible_sets)
  end

  def sequential_available_seats_for_row(row)
    return true if @requested_seats.eql?(1)

    row.map(&:column).each_cons(@requested_seats).select { |x, y| y == x.next }.flatten.count >= @requested_seats
  end

  def possible_sets(row)
    row.combination(@requested_seats).select { |arr| (arr.last.column.to_i - arr.first.column.to_i) == (@requested_seats - 1) && arr.size == @requested_seats }
  end

  def select_best_set(sets)
    best_sets = sets.select { |arr| arr.pluck(:column).include?(best_seat_position.to_i) }
    best_sets = sets if best_sets.empty?
    return best_sets.flatten if best_sets.count == 1
    best_sets.min do |set|
      (set.last.column.to_i - best_seat_position) + (set.first.column.to_i - best_seat_position) - DISRUPTIVE_FACTOR
    end.flatten
  end

  private
    DISRUPTIVE_FACTOR = 0.01

    def best_seat_position
      seat = (@venue.columns.to_f / 2.0)
      if @venue.columns.even?
        @best_seat_position = seat
      else
        @best_seat_position = seat + 0.5
      end
    end
end
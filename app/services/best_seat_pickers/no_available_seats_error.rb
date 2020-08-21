# frozen_string_literal: true

module BestSeatPickers
  class NoAvailableSeatsError < StandardError
    def message
      "There are no available seats."
    end
  end
end

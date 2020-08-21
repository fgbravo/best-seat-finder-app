# frozen_string_literal: true

class AvailableSeatsController < ApplicationController
  before_action :entities_params, only: :create

  def new

  end

  def create
    entities = EntitiesBuilder.new(entities_params)
    @result = BestSeatPicker.new(entities.venue, entities.available_seats, entities.requested_seats).find
  rescue EntitiesBuilders::ValidationsError => e
    @errors = e
  rescue BestSeatPickers::NoAvailableSeatsError => e
    @errors = e
  end

  private
    def entities_params
      params.permit!
    end
end

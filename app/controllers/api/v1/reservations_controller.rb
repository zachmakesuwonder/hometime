class Api::V1::ReservationsController < ApplicationController
  def reserve
    @reservation = ReservationManager::ReservationConstructor.new(params)
    if @reservation.reserve!
      render json: @reservation.payload
    else
      raise ApiException::BadRequest
    end
  end
end
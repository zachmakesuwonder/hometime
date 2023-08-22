class Api::V1::ReservationsController < ApplicationController
  def reserve
    payload = ReservationAdapter.call(params)
    @reservation = ReservationManager::ReservationConstructor.new(payload: payload, code: payload.code, email: payload.email)
    if @reservation.reserve!
      render json: @reservation.payload
    else
      raise ApiException::BadRequest
    end
  end
end
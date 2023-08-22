class Api::V1::ReservationsController < ApplicationController
  def reserve
    reservation_adapter = ReservationAdapter.call(request.request_parameters)
    reservation = ReservationManager::ReservationConstructor.new(payload: reservation_adapter.payload, code: reservation_adapter.code, email: reservation_adapter.email)
    if reservation.reserve!
      render json: reservation.payload
    else
      raise ApiException::BadRequest
    end
  end
end
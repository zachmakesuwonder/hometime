class ReservationAdapter < ApplicationService
  attr_accessor :payload

  def initialize(payload)
    @payload = payload
  end

  def call
    if @payload["reservation_code"].present?
      ReservationManager::AirbnbAdapter.new(@payload.except(:reservation))
    elsif @payload["reservation"].present?
      ReservationManager::BookingAdapter.new(@payload)
    else
      self
    end
  end

  def code
    # null
  end

  def email
     # null
  end
end
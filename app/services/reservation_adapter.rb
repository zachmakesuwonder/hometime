class ReservationAdapter < ApplicationService
  attr_accessor :payload

  def initialize(payload)
    @payload = payload
  end

  def call
    # Note: Partners can be put in database and make Dynamic Adapter based on params/payload
    @payload = if @payload["reservation_code"].present? 
                ReservationManager::AirbnbAdapter.new(@payload)
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
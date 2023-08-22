module ReservationManager
  class BookingAdapter < ReservationAdapter
    attr_accessor :payload
    
    def initialize(payload)
      @payload = payload
    end

    def code
      @payload["reservation"]["code"] if @payload["reservation"].present?
    end

    def email
      @payload["reservation"]["guest_email"] if @payload["reservation"].present?.present?
    end
  end
end
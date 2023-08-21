module ReservationManager
  class ReservationConstructor
    attr_reader :payload
    attr_accessor :reservation
    attr_accessor :guest

    def initialize(payload)
      @payload = payload
      @reservation = build_reservation
      @guest = build_guest
    end

    def reserve!
      ActiveRecord::Base.transaction do
        @guest.save
        @reservation.payload = @payload
        @reservation.guest = @guest
        @reservation.save
      end
    end

    def payload
      @reservation.payload
    end

    def build_reservation
      code = if @payload["reservation_code"].present? # Airbnb
        @payload["reservation_code"]
      elsif @payload["reservation"].present? # Booking.com
        @payload["reservation"]["code"]
      else
        # null
      end
      Reservation.find_or_initialize_by(code: code)
    end

    def build_guest
      email = if @payload["guest"].present? # Airbnb
        @payload["guest"]["email"]
      elsif @payload["reservation"].present? # Booking.com
        @payload["reservation"]["guest_email"]
      else
        # null
      end
      Guest.find_or_initialize_by(email: email)
    end

  end
end




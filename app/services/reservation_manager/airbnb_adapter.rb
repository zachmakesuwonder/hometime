module ReservationManager
  class AirbnbAdapter
    attr_accessor :payload

    def initialize(payload)
      @payload = payload
    end

    def code
      @payload["reservation_code"] if @payload["reservation_code"].present?
    end

    def email
      @payload["guest"]["email"] if @payload["guest"].present?
    end
  end
end
module ReservationManager
  class ReservationConstructor
    attr_accessor :payload
    attr_accessor :reservation
    attr_accessor :guest

    def initialize(payload:, code:, email:)
      @payload = payload
      @reservation = Reservation.find_or_initialize_by(code: code)
      @guest = Guest.find_or_initialize_by(email: email)
    end

    def reserve!
      ActiveRecord::Base.transaction do
        @guest.save
        @reservation.payload = @payload
        @reservation.guest = @guest
        @reservation.save
      end
    end
  end
end




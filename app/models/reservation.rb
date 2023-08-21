class Reservation < ApplicationRecord
  belongs_to :guest
  
  serialize :payload

  validates :payload, presence: true
  validates :code, presence: true
  validates :code, uniqueness: true
end

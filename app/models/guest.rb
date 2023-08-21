class Guest < ApplicationRecord  
  has_many :reservations
  
  validates :email, presence: true
  validates :email, uniqueness: true
end

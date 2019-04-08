class Booking < ApplicationRecord
  has_many :cleaner

  validates :customer_name,  presence: true
  validates :cleaner_name, presence: true
end

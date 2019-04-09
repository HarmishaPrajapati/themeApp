class Cleaner < ApplicationRecord
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  belongs_to :booking ,optional: true

  validates :first_name,  presence: true
  validates :last_name, presence: true
  validates_numericality_of :quality_score, :less_than_or_equal_to  => 5.0
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
end

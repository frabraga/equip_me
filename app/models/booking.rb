class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :equipment

  validates :user_id, presence: true
  validates :equipment_id, presence: true
  has_many :reviews
end

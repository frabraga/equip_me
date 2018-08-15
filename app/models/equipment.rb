class Equipment < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def photo_helper
    remote_photo_url ? photo : ''
  end
end

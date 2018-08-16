class Equipment < ApplicationRecord
  include AlgoliaSearch

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def photo_helper
    remote_photo_url ? photo : ''
  end

  algoliasearch do
    attribute :name, :description
    searchableAttributes ['name', 'unordered(description)']
    customRanking ['desc(likes_count)']
  end

   Equipment.reindex
end

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

  def rating
    rating = 0
    count = 0
    self.bookings.each do |b|
      b.reviews.each do |r|
        rating += r.rating
        count += 1
      end
    end
    rating = rating / count unless count == 0
    return rating
  end
end

class Artwork < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  validates :title, :artist, :category, :description, :price, :location, presence: true
  scope :by_artist, ->(artist) { where(artist: artist) }
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end

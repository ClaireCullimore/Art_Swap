class Artwork < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :artist, :category, :description, presence: true
  scope :by_artist, ->(artist) { where(artist: artist) }
end

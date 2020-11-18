class Artwork < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings
  validates :title, :artist, :category, :description, presence: true
  scope :by_artist, ->(artist) { where(artist: artist) }
end

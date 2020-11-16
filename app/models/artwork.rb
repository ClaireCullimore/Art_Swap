class Artwork < ApplicationRecord
  belongs_to :user
  validates :title, :artist, :category, :description, presence: true
end

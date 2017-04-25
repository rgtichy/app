class Song < ApplicationRecord
  has_many :playlists
  has_many :users, through: :playlists
  validates :artist, :title, presence: true
  validates :artist, :title, length: { minimum: 2}
end

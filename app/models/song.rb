class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: [true, false]
  validates :released, exclusion: [nil]
end

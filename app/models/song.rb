class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {
    scope: [:artist_name, :release_year],
    message: 'One artist cannot release the same song in the same year'
  }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { less_than: 2020 }, presence: true, if: :released
end

class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates_inclusion_of :released, in: [true, false]
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
  validates :artist_name, presence: true
end

class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year }
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
end

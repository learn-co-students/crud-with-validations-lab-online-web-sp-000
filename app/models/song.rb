class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "Cannot release same song more than once per year." }
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
end

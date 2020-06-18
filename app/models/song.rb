class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, allow_blank: true
end

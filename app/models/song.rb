class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates_uniqueness_of :artist_name, scope: :release_year
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year }, if: :released_is_true?
  #validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released_is_true?

  def released_is_true?
    released == true
  end
end

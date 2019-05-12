class Song < ApplicationRecord
  validates :title, presence: true
  validate :not_by_same_artist_in_same_year
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
  validates :artist_name, presence: true

  def released?
    released
  end

  def not_by_same_artist_in_same_year
    already_exists = false
    already_exists = Song.any? do |song|
      artist_name == song.artist_name &&
      release_year == song.release_year &&
      title == song.title &&
      song.id != nil &&
      id != song.id
    end
    if already_exists
      errors.add(:title, "can't be released twice by the same artist in the same year")
    end
  end
end

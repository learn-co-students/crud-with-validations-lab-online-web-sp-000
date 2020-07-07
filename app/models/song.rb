class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true
  validate :bad_date
  validate :duplicate_song

  def bad_date
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "release year can't be in the future")
    end
  end

  # if release year is the same and song title is the same, then invalidate
  def duplicate_song
    if Song.any? {|song| song.title == title && song.artist_name == artist_name && song.release_year == release_year}
      errors.add(:title, "can't release same song twice in one year")
    end
  end

end

class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_valid?
  validate :same_song?
  validates :artist_name, presence: true

  def release_year_valid?
    if !released && release_year
      errors.add(:release_year, "cannot have a release year when not released")
    elsif released && !release_year
      errors.add(:release_year, "must have release year when released")
    elsif release_year && release_year > Time.now.year
      errors.add(:release_year, "cannot release a song in the future")
    end
  end

  def same_song?
    song = Song.find_by(title: title)
    if song && release_year && song.release_year == release_year
      errors.add(:title, "cannot release a song with the same name twice in the same year")
    end
  end
end

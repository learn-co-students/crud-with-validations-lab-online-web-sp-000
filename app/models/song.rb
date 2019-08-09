class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validate :release_year_check?
  validate :title_check?
  validates :artist_name, presence: true

  private

  def title_check?
    song = Song.find_by(title: self.title)
    if song
      if (song.artist_name == self.artist_name) && (song.release_year == self.release_year)
        errors.add(:message, "This song already exists")
      end
    end
    true
  end

  def release_year_check?
    if !self.released
      true
    elsif !!self.release_year && (self.release_year < DateTime.now.year)
      true
    else
      errors.add(:message, "Invalid release year")
    end
  end
end

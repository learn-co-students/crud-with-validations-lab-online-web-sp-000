class Song < ApplicationRecord
  validates :title, presence: true
  validate :same_song_same_year
  validates :released, inclusion: { in: [true, false]}
  validate :future_release_year
  validates :artist_name, presence: true


  def same_song_same_year
    if Song.all.any?{|song| (song.title == self.title && song.release_year == self.release_year) && self != song}
      errors.add(:title, "Already released this song this year")
    end
  end

  def future_release_year
    if self.released && self.release_year.blank?
      errors.add(:release_year, "This is required")
    elsif self.released && self.release_year > Time.now.year
      errors.add(:release_year, "You can't release an album in the future")
    end
  end
end

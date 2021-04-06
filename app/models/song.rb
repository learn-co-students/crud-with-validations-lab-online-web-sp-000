class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :wrong_title
  validates :release_year, presence: true, if: :released?
  validate :wrong_date

  def wrong_date
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "Release year cannot be in the future")
    end
  end

  def wrong_title
    if Song.any? { |s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
      errors.add(:title, "Already in your library")
    end
  end
  
end

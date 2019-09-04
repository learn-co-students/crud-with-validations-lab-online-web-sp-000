class Song < ActiveRecord::Base
  validates :title, presence: true
  validate  :unique_title
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released?
  validate  :is_released?
  validates :genre, presence: true

  def is_released?
    if release_year.present? && release_year < Date.today.year
      errors.add(:release_year, "Release year can't be in the future")
    end
  end

  def unique_title
    if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
      errors.add(:title, "no duplicate titles")
    end
  end
end

class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validate :cannot_be_repeated_in_same_year
  validate :release_year_vs_released
  validate :release_year_not_in_future

  def cannot_be_repeated_in_same_year
    errors.add(:title, 'cannot be repeated by the same artist in the same year') if Song.find_by(:title => title, :release_year => release_year, :artist_name => artist_name)   
  end

  def release_year_vs_released
    errors.add(:release_year, 'cannot be blank if song has been released') if (released && !release_year)
  end

  def release_year_not_in_future
    errors.add(:release_year, 'must be less than or equal to the current year') if release_year && release_year > Date.today.year
  end

end

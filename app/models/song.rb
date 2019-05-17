require 'pry'

class Song < ApplicationRecord
  validates :title, presence: true
  validate :same_song_same_year
  validates :released, inclusion: {in: [true, false]}
  validate :release_year_required_if_released_optional_if_not
  validates :artist_name, presence: true

  def same_song_same_year
    if Song.all.detect{|previous_song| previous_song.title == title && previous_song.release_year == release_year}
      errors.add(:title, "was already released this year")
    end
  end

  def release_year_required_if_released_optional_if_not
    if released
      if release_year.nil?
        errors.add(:release_date, "must be provided if it is released")
      elsif release_year > Time.new.year
        errors.add(:release_date, "cannot be in the future")
      end
    end
  end
end

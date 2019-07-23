class Song < ApplicationRecord
  validates :title, presence: true
  validate :title_cannot_be_repeated_by_same_artist_in_same_year
  validates :released, inclusion: {in: [true, false]}
  validate :if_released_must_have_release_year
  validates :artist_name, presence: true

  def title_cannot_be_repeated_by_same_artist_in_same_year
    def fails_validation?
      songs_with_same_title_and_year = Song.all.select do |song|
        song.title == title && song.release_year == release_year
      end

      !songs_with_same_title_and_year.empty?
    end

    if fails_validation?
      errors.add(:title, "can't be repeated by the same artist in the same year")
    end
  end

  def if_released_must_have_release_year
    def passes_validation?
      if !released
        true
      elsif released && release_year != nil && release_year <= Time.new.year
        true
      else
        false
      end
    end

    if !passes_validation?
      errors.add(:release_year, "must be present if song was released")
    end
  end
end

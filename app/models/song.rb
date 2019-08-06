class Song < ApplicationRecord
    validates :name, presence: true
    validate :unique_name_for_artist_name_and_release_year
    validates :released, inclusion: { in: [true, false] }
    validate :valid_release_year_if_released
    validates :artist_name, presence: true

    def unique_name_for_artist_and_year
        song = Song.find_by(self.name)
        if !!song && song.artist_name == self.artist_name && song.release_year == self.release_year
            errors.add(:name, "A song with this name has already been released by this artist this year")
        end
    end

    def valid_release_year_if_released
        if self.released && !self.release_year 
                errors.add(:release_year, "A released song must have a release year")
            end
        end
        if self.release_year > Time.new.year)
            errors.add(:name, "Release year must be less than or equal to the current year")
        end

    end
end

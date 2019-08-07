class Song < ApplicationRecord
    validates :title, presence: true
    validate :unique_name_for_artist_name_and_release_year
    validates :released, inclusion: { in: [true, false] }
    validate :valid_release_year_if_released
    validates :artist_name, presence: true

    def unique_name_for_artist_name_and_release_year
        song = Song.find_by(title: self.title)
        if !!song && song.artist_name == self.artist_name && song.release_year == self.release_year
            errors.add(:title, "A song with this title has already been released by this artist this year")
        end
    end

    def valid_release_year_if_released
        if self.released 
            if !self.release_year 
                errors.add(:release_year, "A released song must have a release year")
            elsif self.release_year > Time.new.year
                errors.add(:title, "Release year must be less than or equal to the current year")
            end

        end
    end
end

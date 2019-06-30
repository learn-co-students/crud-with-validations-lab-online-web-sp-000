class Song < ApplicationRecord
    validates :title, presence: true
    validate :title_cannot_be_repeated
    validate :release_year_not_blank_when_released
    validate :release_year_is_valid_year
    
    def title_cannot_be_repeated
        if Song.find_by(title: self.title, artist_name: self.artist_name, release_year: self.release_year)
            errors.add(:title, "title cannot be repeated by the same artist in the same year")
        end
    end

    def release_year_not_blank_when_released
        if self.released == true && self.release_year == nil
            errors.add(:release_year, "release year cannot be blank if song is released")
        end
    end

    def release_year_is_valid_year
        if !!self.release_year
            if self.release_year > DateTime.now.year
                errors.add(:release_year, "release year cannot be greater than current year")
            end
        end
    end

end

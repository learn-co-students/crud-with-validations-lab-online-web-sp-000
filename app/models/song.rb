class Song < ApplicationRecord
    validate :valid_title
    validates :artist_name, presence: true
    validate :valid_release_year?

    private

    def valid_title
        if !self.title.present?
            errors.add(:title, "Invalid Title: Title cannot be blank")
        end

        song = Song.find_by(title: self.title)

        if self.title.present? && song != nil && song.artist_name == self.artist_name && song.release_year == self.release_year
            errors.add(:title, "Invalid Title: Another title by the same name has been released by this artist this year")
        end
    end

    def valid_release_year? 
        if self.released == true && !self.release_year.present?
            errors.add(:release_year, "Invalid Release Year: Cannot be blank if song has been released")
        end
        
        if self.release_year.present? && self.release_year > Date.today.year
            errors.add(:release_year, "Invalid Release Year: Cannot be in the future")
        end
    end
end

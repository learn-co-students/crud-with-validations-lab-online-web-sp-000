class Song < ApplicationRecord

    validates :title, :artist_name, presence: true
    
    validates :release_year, presence: true
    validates :release_year, numericality: { only_integer: true}
    validates :release_year, more_than_current_year: false

    def released?
        if self.released == true
            return true
        else
            errors.add("Song is not yet released")
            return false
        end
    end

    def more_than_current_year
        if self.release_year > Time.now.year
            errors.add("Song release year must not be in the future")
            return true
        else
            return false
        end
    end

end

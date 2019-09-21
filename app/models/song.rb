class Song < ApplicationRecord
    validates :title, presence: true
    validates :not_comeout_the_same_year_with_same_artist

    def not_comeout_the_same_year_with_same_artist
        if Song.all.any?{|s|s.title==title && s.artist_name=artist_name && s.release_year=release_year}
         errors.add(:title, "Titles cannot be repeated by the same artist in the same year")
        end
    end
          
end

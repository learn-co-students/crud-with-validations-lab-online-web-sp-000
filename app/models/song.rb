class Song < ApplicationRecord
    validates :title, presence: true,
    uniqueness:{ 
        scope: %i[release_year artist_name]}
    # validate :not_comeout_the_same_year_with_same_artist?

    # def not_comeout_the_same_year_with_same_artist?
    #     if Song.all.any?{|s|s.title==title && s.artist_name==artist_name && s.release_year==release_year}
    #      errors.add(:title, "Titles cannot be repeated by the same artist in the same year")
    #      false
    #     else
    #      true
    #     end
    # end

    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end
    
      def released?
        released
      end
    
          
end

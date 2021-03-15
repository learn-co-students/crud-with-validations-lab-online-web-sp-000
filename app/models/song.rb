class Song < ActiveRecord::Base
    
    validates :title, presence: true 
    validates :title, uniqueness: {
        scope: %i[release_year artist_name], #creates array of symbols & uses array to check uniqueness of a title against it's release year & artist
        message: 'cannot be repeated by the same artist in the same year'
    }

    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true 

    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year #iterates through all instances of song, checking if released––and if released, validating against presence of release year and that it was released on or before today's date. Numbericality validates that attributes have only numeric values.  
        }
    end 

    def released?
        released
    end 
end

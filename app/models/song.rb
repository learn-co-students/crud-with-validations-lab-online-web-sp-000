class Song < ApplicationRecord
    validates :title, presence: true
    validates_with ReleaseYearValidator
    validates :artist_name, presence: true 
    validates :title, uniqueness: { 
        scope: %i[release_year artist_name], 
        message: "Whatever error"
     }
#    with_options if: :released? do | song |
 #       song.validates :release_year, presence: true
  #      song.validates :release_year, numerically: {
   #         less_than_or_equal_to: Date.today.year 
    #    }
    #end
   # validates_with DuplicateValidator
   #def artist_year
    #    if Song.any?{ | song | song.title == title && song.artist_name == artist_name && song.release_year == release_year }
     #       errors[artist_name << "Can't have two songs by the same artist in one year, they're not that talented"]
      #  end
   #end
end

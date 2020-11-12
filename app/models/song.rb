class Song < ApplicationRecord

    
    validates :artist_name, presence: true

    #Cannot be repeated by the same artist in the same year
    validates :title, uniqueness: {scope: [:release_year, :artist_name], message: "can't be released twice by the same artist in the same year"}
    validates :title, presence: true
    
    # released_year - required if released is true
    # released_year - optional - if released is false
    #validates :release_year,  - must be == or < current year
    validates :released, inclusion: { in: [true, false] }
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Time.now.year
        }
    end
   
end

 

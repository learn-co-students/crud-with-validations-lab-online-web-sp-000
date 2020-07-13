class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: %i[release_year artist_name], message: "Cannot be repeated by the same artist in the same year"}
      # Cannot be repeated by the same artist in the same year
   
    validates :artist_name, presence: true

    validates :released, inclusion: { in: [true, false]}
        # Must be true or false

    with_options if: :released? do |song|
        song.validates :release_year, presence: true 
            #  Must not be blank if released is true
            #  Optional if released is false (aka no need to write a validation)
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year
            #  Must be less than or equal to the current year
        }
    end 

    def released?
        released 
    end 
end

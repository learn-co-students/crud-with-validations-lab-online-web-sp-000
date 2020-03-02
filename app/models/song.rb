class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: %i[release_year artist_name], # %i is array of symbols => [ :y, :x ]
        message: 'cannot be repeated by the same artist in the same year'
    }
    validates :released, inclusion: {in:[true, false]}

    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year
        } #numericality: This helper validates that your attributes have only numeric values 
    end#this helper also accepts the following options to add constraints to acceptable values:
    #:less_than_or_equal_to - Specifies the value must be less than or equal to the supplied value. The default error message for this option is "must be less than or equal to %{count}".
        #validates :released_year, if: :released?, presence: true
        #validates :released_year, if: :released?, numericality: {
            #less_than_or_equal_to: Date.today.year
        #}
    #with_options - way to factor duplication out 

    validates :artist_name, presence: true

    def released?
        released
    end

end

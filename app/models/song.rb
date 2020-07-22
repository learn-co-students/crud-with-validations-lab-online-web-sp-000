class Song < ActiveRecord::Base  
    validates :title, :artist_name, presence: true 
    validates :title, uniqueness: { scope: %i[release_year artist_name], message: 'cannot be repeated by the same artist in the same year' }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: -> { released == true }, numericality: { less_than_or_equal_to: Date.current.year }

    def released?
        released == true 
    end 
end 
class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: -> { self.released == true }, numericality: { less_than_or_equal_to: Date.today.year } 
    validates :artist_name, presence: true

end

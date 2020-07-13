class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:released, :artist_name], message: 'the same artist cannot make the same song in the same year' }
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true

    with_options if: :released do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
    end
    
end

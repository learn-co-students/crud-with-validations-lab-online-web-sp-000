class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {
        scope: [:release_year, :artist_name],
        message: "Artists must use a unique title within the same year"
    }
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true

    with_options if: :released do |song|
        song.validates :release_year, presence: true, numericality: {
            less_than_or_equal_to: Date.today.year
        }
    end

end

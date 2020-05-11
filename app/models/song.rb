class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year], message: "cannot be released under the same artist in the same year"}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?
    validates :release_year, uniqueness: { scope: [:artist_name, :release_year] }
    with_options if: :released? do |song|
        song.validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year }
    end
    validates :artist_name, presence: true

    def released?
        !!released
    end
end

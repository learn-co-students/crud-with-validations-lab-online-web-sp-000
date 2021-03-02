class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, inclusion: [true, false]
    with_options if: :released? do |released_song|
        released_song.validates :release_year, presence: true
        released_song.validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }
    end
    validates :artist_name, presence: true
    validates :genre, presence: true

    def released?
        !!released
    end


end

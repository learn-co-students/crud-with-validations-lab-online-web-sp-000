class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
    validates :artist_name, presence: true
    validate :no_repeated_title

    def no_repeated_title
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "can't add the same song twice")
        end
    end
end

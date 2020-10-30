class Song < ApplicationRecord
    validates :title, presence: true
    # validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :artist_name, presence: true

    validate :title_not_repeated
    validate :release_year_valid

    def title_not_repeated
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "can't add the same song twice")
        end
    end

    def release_year_valid
        if  release_year.present? && release_year > Time.now.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end

end

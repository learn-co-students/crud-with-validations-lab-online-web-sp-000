class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: :release_year
    validates :released, exclusion: [nil]
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
    validates_presence_of :release_year, if: :released?

    def released?
        self.released
    end
end


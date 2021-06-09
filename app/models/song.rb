class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: :release_year
    validates :released, exclusion: [nil]
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
    validates_presence_of :release_year, if: :released?

    def released?
        self.released
    end
end

# very interesting solution:

# validates :title, presence: true
#   validates :title, uniqueness: {
#     scope: %i[release_year artist_name],
#     message: 'cannot be repeated by the same artist in the same year'
#   }
#   validates :released, inclusion: { in: [true, false] }
#   validates :artist_name, presence: true

#   with_options if: :released? do |song|
#     song.validates :release_year, presence: true
#     song.validates :release_year, numericality: {
#       less_than_or_equal_to: Date.today.year
#     }
#   end

#   def released?
#     released
#   end


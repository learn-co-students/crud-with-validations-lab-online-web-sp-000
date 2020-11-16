class Song < ApplicationRecord

    validates :title, :artist_name, presence: true
    validates :title, uniqueness: {
        scope: %i[release_year artist_name],
        message: 'cannot be repeated by the same artist in the same year'
      }
      
    validates :released, inclusion: { in: [true, false] }

    with_options if: :released? do |release|
        release.validates :release_year, presence: true
        release.validates :release_year, numericality: {
            less_than_or_equal_to: Date.today.year
        }
    end

    def released?
        released
    end
    #validates :release_year, presence: true, if: :released
end

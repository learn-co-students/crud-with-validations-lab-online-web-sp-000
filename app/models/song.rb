class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {
        scope: %i[release_year artist_name],
        message: 'cannot be repeated by the same artist in the same year'
      }
    
    validates :released, inclusion: { in: [ true, false ] }
    validates :artist_name, presence: true
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year }, if: :released
end

class Song < ApplicationRecord

    validates :title, presence: true 
    validates :title, uniqueness: { scope: :release_year }
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :released
end

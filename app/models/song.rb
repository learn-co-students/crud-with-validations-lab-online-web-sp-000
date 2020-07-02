class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    #validates :title, 
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year}, if: :released
end



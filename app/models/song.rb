class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year } 
    validates :released, inclusion: { in: [ true, false ] }
    validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Time.now.year }
end

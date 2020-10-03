class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true, unless: -> { !release_year } 
    validates :release_year,  :numericality => { less_than_or_equal_to: 2020 }, unless: -> { !released } 
    validates :artist_name, presence: true
    validates :release_year, presence: true, unless: -> { !released } 
end

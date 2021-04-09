class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: -> {released == true}
    validates :release_year, numericality: { less_than_or_equal_to: Time.current.year,  only_integer: true }, if: -> {released == true}
    validates :release_year, uniqueness: true, if: -> {released == true}    
end

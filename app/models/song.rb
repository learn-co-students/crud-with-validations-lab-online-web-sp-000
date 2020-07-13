require 'pry'
class Song < ApplicationRecord

    validates :title, presence: true 
    validates_uniqueness_of :title, :scope => :artist_name
    with_options if: :released? do |song|
        song.validates :release_year, presence: true, 
            numericality: { 
                             only_integer: true,
                             less_than_or_equal_to: Date.today.year
                           }
    end 

    def released?
        released 
    end 
end


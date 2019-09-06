class Song < ApplicationRecord
  validates :title, :length => { :minimum => 1 }
  validates :title, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, :length => { :minimum => 1 }
  
  with_options if: :released do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
  end
  
  
end



#  validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
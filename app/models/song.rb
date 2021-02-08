class Song < ApplicationRecord
  validates :title, null: false
  validates_presence_of :released 
  validates_presence_of :release_year, null: false if: -> {:released == "true"}
  validates :release_year, numericality: {less_than_or_equal_to: -> { Date.current.year } }
end

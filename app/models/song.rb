require 'pry'
class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: {scope: :release_year, message: "same artist cannot exist in same year" }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year },  presence: true, if: :released?
  # validates :release_year, presence: true, if: :released?
    
  private
  def released?
    released == true
  end
end

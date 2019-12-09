class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, presence: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }
  validates :artist_name, presence: true
  validates :genre, presence: true

  def released?
    self.released == true 
  end
  
end

class Song < ApplicationRecord
  validates :title, presence: true 
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

  with_options if: :released? do |song| #if released option returns true
    song.validates :release_year, presence: true #makes sure release year is not blank 
    song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year} #makes sure that date is not in the future
  end

  def released? #returns value of released attr ==> true if true, false if false
    released
  end
end

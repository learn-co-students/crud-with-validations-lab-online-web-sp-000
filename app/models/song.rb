class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

  with_options if: :released do |e|
    e.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}
    e.validates :release_year, presence: true
  end

end

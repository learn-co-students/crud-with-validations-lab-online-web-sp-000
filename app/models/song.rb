class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: "should happen once per year"
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  with_options if: :released == true do |song|
    song.validates :release_year, numericality: {
      only_integer: true,
      less_than_or_equal_to: ->(_brewery) {Date.current.year}
      }
  end
end

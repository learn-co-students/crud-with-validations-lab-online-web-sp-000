class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: :release_year,
    message: "cannot be repeated in the same year"}
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end



  def released?
    released
  end

end

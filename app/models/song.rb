class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: "a song cannot be released twice in teh same year by the same artist"
  }
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true

  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Time.current.year
    }
  end

  def released?
    self.released == true
  end

end

class Song < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'Title cannot be repeated by same artist in the same year'
  }

  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |s|
    s.validates :release_year, presence: true
    s.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  validates :artist_name, presence: true

  def released?
      self.released
  end

end

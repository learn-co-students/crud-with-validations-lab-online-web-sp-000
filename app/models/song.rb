class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :has_song_released?
  validates :release_year, numericality: {less_than_or_equal_to: :current_year}, allow_nil: true
  validates :title, uniqueness: {scope: %i[release_year artist_name]}

  def has_song_released?
    released
  end

  def current_year
    Date.today.year
  end

end

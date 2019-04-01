class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released_song?
  validates_numericality_of :release_year, less_than_or_equal_to: :current_year, allow_nil: true
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]

  def released_song?
    released
  end

  def current_year
    Date.today.year
  end
end

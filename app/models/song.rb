class Song < ApplicationRecord

  validates :title, :artist_name, presence: true
  validates :artist_name, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, inclusion: { in: 0..Time.new.year }, if: :released?

  def released?
    self.released
  end

end

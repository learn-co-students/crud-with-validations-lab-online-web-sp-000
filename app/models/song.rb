class Song < ApplicationRecord
  validates :title, presence: true
  validates_with ReleaseYearValidator, fields: [:release_year]
  validates :artist_name, presence: true

  def released?
    if self.released == true
      true
    else
      false
    end
  end
end

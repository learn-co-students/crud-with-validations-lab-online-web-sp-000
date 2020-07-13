class Song < ApplicationRecord
  validates :title, presence: true
  validates :release_year, inclusion: { in: 1900..Time.now.year }, if: -> {self.released}
  validates_with SongYearValidator
end

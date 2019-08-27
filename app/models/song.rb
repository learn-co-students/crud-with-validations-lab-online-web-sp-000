class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: {scope: [:artist_name, :release_year]}
  validates :released, inclusion: { in: [true, false]}
  validates :release_year, presence: true, if: :released
  validate :valid_release_date?

  def valid_release_date?
    if release_year.present? && release_year > Date.today.year
      errors[:release_year] << 'Release date cannot be in the future'
    end
  end

end

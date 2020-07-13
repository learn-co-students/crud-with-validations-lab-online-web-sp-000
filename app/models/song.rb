class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: %i[release_year artist_name], case_sensitive: false }
  validate :valid_year
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_needed_on_true

  private

  def valid_year
    return if release_year.nil?

    unless Date.today.year >= release_year
      errors.add(:release_year, 'Year out of range')
  end
  end

  def release_year_needed_on_true
    if released
      if release_year.nil?
        errors.add(:release_year, 'cannot be nil when song is released')
      end
    end
  end
end

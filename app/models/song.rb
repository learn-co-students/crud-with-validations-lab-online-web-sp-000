class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {scope: [:release_year, :artist_name]}
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :released, exclusion: { in: [nil] }
  with_options if: :is_released? do |song|
    song.validates :release_year, presence: true
    song.validate :release_cannot_be_in_future
  end



  def is_released?
    self.released
  end

  def release_cannot_be_in_future
    if (self.release_year.present? && self.release_year > DateTime.now.strftime("%Y").to_i)
      errors.add(:release_year, "Cannot be in the future")
    end
  end


end

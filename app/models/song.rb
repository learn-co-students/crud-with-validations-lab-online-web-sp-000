class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, presence: true, allow_blank: true
  validates :release_year, presence: true, uniqueness: true, inclusion: 1900..2019, allow_blank: true
  validate :check_released


  def check_released
  if released == true && release_year == nil
    self.errors.add(:release_year, "cannot be blank!")
  elsif released == true && release_year >= 2019
    self.errors.add(:release_year, "cannot be in the future!")
  end

  end
end

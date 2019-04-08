class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  #validates :released, presence: true
  validates :artist_name, presence: true
  validate :release_year_validator

  private

  def release_year_validator
    if released == true && release_year == nil
      errors.add(:release_year, "must include release year")
    end
    if release_year
      if release_year > Time.current.year.to_i
        errors.add(:release_year, "can't  postdate release")
      end
    end
  end

end

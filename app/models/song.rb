class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: {
    scope: :release_year, message: "cannot have same title in same year"
  }
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_legit

  def release_year_legit
    if released && !release_year
      errors.add(:release_year, "Must include release year")
    elsif released && release_year
      if release_year > Time.now.year
        errors.add(:release_year, "Must not be in future")
      end
    elsif !released && release_year
      errors.add(:release_year, "Released must be true")
    end
  end

end

# Way better than release_year_legit

# with_options if: :released do |r|
#     r.validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.today.year}
#   end

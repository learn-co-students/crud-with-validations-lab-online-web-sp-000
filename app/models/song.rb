class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validate :release_year?

  def release_year?
    if self.released && !self.release_year.blank? && (self.release_year > Time.now.year)
      self.errors.add(:release_year, "release year must be less than or equal to current year if released is true")
    end
    if self.released && self.release_year.blank?
      self.errors.add(:release_year, "release year must not be blank if released is true")
    end
  end

=begin

validates :description, presence: true, if: -> {current_step == steps.first || require_validation}
hash = {}
hash[:title] = "Test Title"
hash[:released] = true
hash[:artist_name] = "Test Artist"
hash[:genre] = "Test Genre"

hash[:release_year] = 2024
=end
end

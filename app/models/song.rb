class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: [true, false] }
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Time.now.year }

end

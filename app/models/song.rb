class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_with SameYearValidator
  validates :released, inclusion: { in: [true, false]}
  validates_with ReleaseYearValidator
  validates :artist_name, presence: true
end

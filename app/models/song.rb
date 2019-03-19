class Song < ActiveRecord::Base
  validates :title, presence: true
  validates_uniqueness_of :title, scope: [:release_year, :artist_name]
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: ->(song) { Date.current.year }}
end
class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:artist_name, :release_year] }
  validates :released, exclusion: { in: [:nil] }
  validates :release_year, presence: true, if: :released?
  validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, allow_nil: true
end
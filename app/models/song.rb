class Song < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Cannot release the same song twice in a year." }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year }, if: -> { released }

end

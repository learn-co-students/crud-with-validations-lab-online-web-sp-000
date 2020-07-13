class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: {scope: [:artist_name, :release_year], message: "repeated by the same artist in the same year"}
  validates :released, inclusion: { in: [true, false], message: 'either "true" or "false"'}
  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, presence: true, if: :released?
  validates :artist_name, presence: true

  def released?
    released
  end
end

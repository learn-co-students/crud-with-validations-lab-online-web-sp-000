class Song < ApplicationRecord
	validates :title, :artist_name, presence: true
	validates :title, uniqueness: { scope: [:release_year, :artist_name] }
	validates :release_year,
		presence: true,
		if: :released,
		numericality: { less_than_or_equal_to: Time.now.year }
end

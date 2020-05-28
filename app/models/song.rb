class Song < ApplicationRecord

	validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
	validates :released, inclusion: { in: [true, false] }
	with_options if: :is_released? do |release|
		release.validates :release_year, presence: true, numericality: { less_than_or_equal_to: Date.current.year }
	end
	validates :artist_name, presence: true

	def is_released?
		self.released
	end

end

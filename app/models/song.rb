class Song < ApplicationRecord
	validates :title, presence: true,
						uniqueness: { scope: %i[artist_name release_year], message: "Cannot be repeated by the same artist in the same year"}
	validates :artist_name, presence: true
  	validates :released, inclusion: { in: [true, false] }

	validates :release_year, presence: true, 
							if: :released?,
							numericality: { less_than_or_equal_to: Time.now.year }

	def released?
		released
	end





end

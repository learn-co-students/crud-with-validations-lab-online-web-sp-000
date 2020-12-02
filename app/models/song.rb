class Song < ApplicationRecord
	validates :title, presence: true,
						uniqueness: { scope: :artist_name, message: "Cannot be repeated by the same artist in the same year"}
	validates :artist_name, presence: true

	validates :release_year, presence: true, 
							if: :released?,
							numericality: { less_than_or_equal_to: Time.now.year }

	def released?
		released == true
	end





end

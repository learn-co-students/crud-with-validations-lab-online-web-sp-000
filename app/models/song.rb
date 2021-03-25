class Song < ApplicationRecord
 validates :title, presence: true
 validates :title, uniqueness: {scope:[:release_year, :artist_name]}
 validates :released, inclusion: {in: [true,false]}
 validates :artist_name, presence: true
 with_options if: :released do |song|
  song.validates :release_year, presence: true
  song.validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
 end
#  code above is the same thing as the below
#  validates :release_year, presence: true, if: :released
#  validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released
end

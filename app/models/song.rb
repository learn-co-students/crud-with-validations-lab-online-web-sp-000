class Song < ApplicationRecord

  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year}, length: {in: 1..4, message: "please enter a valid year"}, if: :released?
  validates :artist_name, presence: true


  def released?
   self.released
 end


end

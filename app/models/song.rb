class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
   validates :released, inclusion: {in: [true, false]}
   validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Time.now.year}, length: {in: 1..4, message: "please enter a 4 (or less) digit year"}, if: :released?
   validates :artist_name, presence: true #, format: { with: /\A[a-zA-Z\-]+\z/, message: "only allows letters" }
   #validates :genre, format: { with: /\A[a-zA-Z\-\w]+\z/, message: "only allows letters" }
   
   def released?
      self.released
   end
end

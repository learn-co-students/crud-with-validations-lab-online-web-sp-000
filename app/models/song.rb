class Song < ApplicationRecord
   validates :title, presence: true
   validates :title, uniqueness: { scope: :release_year }
   validates :release_year, presence: true, if: :released?
   validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released?
   validates :release_year, presence: false, if: :not_released?

   def released?
      self.released
   end

   def not_released?
      !self.released
   end
end
class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }
end

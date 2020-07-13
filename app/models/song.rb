class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year,  only_integer: true }, if: :released
end

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, numericality: { less_than: 2020}, if: :released?
  validates :title, uniqueness: { scope: :release_year }
end

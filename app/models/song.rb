class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, presence: true, if: :released, numericality: {less_than_or_equal_to: Time.now.year}

  # validates :release_year, presence: true, if: :released

  # binding.pry
  # validates :release_year, :inclusion => { in: [true, false] }
  # validates_inclusion_of :released, :in => [true, false]
end

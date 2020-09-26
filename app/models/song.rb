class Song < ApplicationRecord
    # validates :title, presence: true
    # validates :artist_name, presence: true
    # validates :released, inclusion: { in: [true, false], message: "%{value} is not valid" }
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "should happen once per year" }
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validates :release_year, presence: true, unless: -> { !released }
    validates :release_year, numericality: { less_than_or_equal_to: 2020 }, unless: -> { !released }
end

class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    # "title" must not be blank, cannot be repeated by the same artist in the same year
    validates :released, inclusion: { in: %w(true false) }
    # "released" must be true or false
    # validates :release_year, presence: true, if: -> { :released == :true }, numericality: { less_than_or_equal_to: :Date.today.year }
    # optional if "released" is false, must not be blank if "released" is true
    # Must be less than or equal to the current year
    validates :artist_name, presence: true
end

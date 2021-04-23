class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] } # Cannot be repeated by the same artist in the same year
    validates :released, inclusion: [true, false]
    #validates :release_year #Optional if released is false, Must not be blank if released is true
    validates :release_year, presence: true, if: :released, numericality: { less_than_or_equal_to: Time.now.year } # Must be less than or equal to the current year
end

class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {scope: [:release_year, :artist_name]}
    # validates :released, inclusion: {in: [true, false]}
    validates :release_year, presence: true, numericality: {less_than_or_equal_to: Time.now.year}, if: :released?
    # validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}
end

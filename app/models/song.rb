class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates :release_year, presence: true, if: :released, numericality: { less_than: 2020 }
    validates :artist_name, presence: true

end

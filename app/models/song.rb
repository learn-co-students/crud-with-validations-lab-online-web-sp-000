class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name]}
    validates :released, presence: true, allow_blank: true
    validates :release_year, numericality: { less_than_or_equal_to: DateTime.now.year }, unless: :released?
    validates :artist_name, presence: true

    def released?
        released != true
    end
end

class Song < ApplicationRecord
    validates :title, presence: true
    validates_with TitleValidator
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.new.year }, if: :released?
    validates :artist_name, presence: true
end

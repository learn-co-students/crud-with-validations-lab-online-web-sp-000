class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year,
        message: "should happen once per year" }
    validates :artist_name, presence: true
    validates :release_year, presence: true, if: :is_released?

    def is_released?
        released == true
    end

    include ActiveModel::Validations
    validates_with ReleaseYearValidator

end

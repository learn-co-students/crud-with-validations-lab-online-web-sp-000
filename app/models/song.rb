class Song < ApplicationRecord

    validates :title, presence: true
    validates :artist_name, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "should happen once per year" }
    validates :release_year, presence: true,
        unless: Proc.new { |a| a.released.blank? }
    validate :no_future_dates

    def no_future_dates
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end

end

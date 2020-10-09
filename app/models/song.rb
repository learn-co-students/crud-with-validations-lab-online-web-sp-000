class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :released, exclusion: {in: [nil]}
  validates :genre, format: { without: /[0-9]+\z/}
  with_options if: :released? do |year|
    year.validates :release_year, presence: true
    year.validate :release_year_must_be_current_year_or_less
  end

    def release_year_must_be_current_year_or_less
      #binding.pry
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "can't be in the future")
        end
    end

end

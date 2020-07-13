class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :title, uniqueness: { scope: %i[release_year artist_name], message: "Cannot be repeated by the same artist in the same year" }
  validates :released, inclusion: { in: [true, false] }

  with_options if: :released? do |song|
   song.validates :release_year, presence: true
   song.validates :release_year, numericality: {
     less_than_or_equal_to: Date.today.year
   }
 end



  # validate :you_must_fill
  #
  # def you_must_fill
  #    if released
  #     errors.add(:release_year, "must not be blank")
  #   end
  # end

  # def release_date_cannot_be_in_the_future
  #   if release_year.present? && release_year > Date.today.year
  #     errors.add(:release_year, "can't be in the future")
  #   end
  # end
end

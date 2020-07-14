class Song < ApplicationRecord
  include ActiveModel::Validations
  validates_with TitleValidator
  validates_with ReleaseYearValidator

	validates :title, presence: true
	validates :released, inclusion: { in: [true, false],
    message: "must be either true or false" }
	validates :release_year, presence: true, if: :released?

	def released?
		released == true
	end
end

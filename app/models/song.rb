class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with ReleaseYearValidator
    validates :released, inclusion: { in: [true, false] }
    validates :title, presence: true, uniqueness: { scope: :release_year, message: "song has already been released" }
    validates :artist_name, presence: true
end

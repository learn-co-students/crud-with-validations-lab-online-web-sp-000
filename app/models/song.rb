class Song < ApplicationRecord
    include ActiveModel::Validations
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: { in: [true, false] }
    validates_with ReleaseYearValidator
    validates :artist_name, presence: true
end

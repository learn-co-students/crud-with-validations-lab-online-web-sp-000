class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    include ActiveModel::Validations
    validates_with ReleaseYearValidator
    validates :artist_name, presence: true
end

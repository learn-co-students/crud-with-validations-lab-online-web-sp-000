class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with ReleaseYearValidator
    validates_with TitleYearValidator
    validates :title, presence: true
    validates :artist_name, presence: true
end
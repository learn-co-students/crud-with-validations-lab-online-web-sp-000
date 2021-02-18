class Song < ApplicationRecord
    validates :title, presence: true
    validates_with ReleaseYearValidator
    validates :artist_name, presence: true 
    validates_with DuplicateValidator
end

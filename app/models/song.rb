class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates_with ReleaseYearValidator
    validates_with SongValidator
end

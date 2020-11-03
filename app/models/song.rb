class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, inclusion: { in: [true, false] }
    validates :released, exclusion: { in: [nil] }
    validates :artist_name, presence: true
    include ActiveModel::Validations
    validates_with ReleaseYearValidator


        
end

class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with TitleValidator 
    validates_with ReleasedValidator
    validates_with ReleaseYearValidator     
    validates :artist_name, presence: true  
end

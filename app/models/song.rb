
require_relative '../validators/title_validator'
require_relative '../validators/released_validator'
require_relative '../validators/release_year_validator'
class Song < ApplicationRecord
    #fixed
    validates_with TitleValidator
    #fixed
    validates_with ReleasedValidator

     validates_with ReleaseYearValidator
    #good
    validates :title, :artist_name, presence: true


end




    
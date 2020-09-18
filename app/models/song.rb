class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: 
    {  
        scope: :year,
        message: "should happen once per year" 
    }
    validates :released, inclusion: 
    { 
        in: [true, false], 
        message: "Not a valid boolean."
    }
    validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }
    validates :artist_name, presence: true

    include ActiveModel::Validations
    validates_with ReleaseYearValidator
end

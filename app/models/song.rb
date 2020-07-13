class Song < ApplicationRecord
   include ActiveModel::Validations
   validates_with ReleaseYearValidator
   validates :title, presence: true
   validates :release_year, presence: true, if: :released
   validates :title, uniqueness: 
   { scope: :release_year, message: "Can't release same song twice in a year!"}
end 
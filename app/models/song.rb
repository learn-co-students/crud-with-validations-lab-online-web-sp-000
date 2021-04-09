class Song < ApplicationRecord
  validates :title, :artist_name, presence: true
  validates :release_year, presence: true, unless: Proc.new {|object| object.released == false || object.released == nil }  
  
  include ActiveModel::Validations
  validates_with ReleasedValidator
  validates_with ReleaseYearAndTimeValidator
  validates_with ArtistAndReleaseYearValidator
  
end

class Song < ApplicationRecord
  include ActiveModel::Validations
  
  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "Cannot be repeated by the same artist in the same year." }
  
  with_options if: :released do |s|
    s.validates :release_year, presence: true
    s.validates_with ReleaseYearValidator
  end
end
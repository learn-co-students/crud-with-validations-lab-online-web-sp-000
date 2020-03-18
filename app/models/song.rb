class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with TitleValidator

  validates_with ReleaseYearValidator

  validates :artist_name, presence: true
end

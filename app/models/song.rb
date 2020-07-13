class Song < ApplicationRecord

  include ActiveModel::Validations
  validates_with ReleaseYearValidator, ReleasedValidator, TitleValidator

  validates :artist_name, :title, presence: true

end

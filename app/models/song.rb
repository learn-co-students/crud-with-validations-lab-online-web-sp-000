class Song < ApplicationRecord
  include ActiveModel::Validations
  validates_with ReleaseYearValidator
  validates :title, presence: true
  validates :title, uniqueness: true
end

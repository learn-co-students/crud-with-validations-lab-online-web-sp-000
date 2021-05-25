class Song < ApplicationRecord
  include ActiveModel::Validations
  validates :artist_name, presence: true
  validates_with TitleValidator
  validates_with ReleaseYearValidator
  
  def out?
    if self.released? == true
      "Released"
    else
      "Un-Released"
    end
  end
end

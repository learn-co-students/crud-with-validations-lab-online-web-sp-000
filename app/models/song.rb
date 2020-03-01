class Song < ActiveRecord::Base
    include ActiveModel::Validations
    validates :release_year, presence: true, if: :released
    validates_with DateValidator
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "should only be released once per year"}
end
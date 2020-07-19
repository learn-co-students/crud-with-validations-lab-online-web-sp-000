class Song < ApplicationRecord
    include ActiveModel::Validations
    validates :title, presence: true
    validates :released, inclusion: [true, false]
    validates :artist_name, presence: true
    validates_with SongValidator
end

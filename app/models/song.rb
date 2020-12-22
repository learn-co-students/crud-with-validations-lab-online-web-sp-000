class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true  
    include ActiveModel::Validations
    validates_with SongValidator

    def set_artist_year
        "#{self.title} #{self.artist_name} #{self.release_year}"
    end
    validates :artist_year, uniqueness: true
end

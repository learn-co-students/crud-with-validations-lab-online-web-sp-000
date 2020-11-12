class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year]}
    validates :release_year, presence: true, if: :released?
    validates :release_year, absence: true, unless: :released?
    validates :release_year, numericality: {less_than_or_equal_to: Time.now.year}, if: :released?
 
    def released?
        if released == true
            return true
        elsif released == false || released == nil
            return false
        end
    end
end

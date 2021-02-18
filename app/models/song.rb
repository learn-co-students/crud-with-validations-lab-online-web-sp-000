class Song < ApplicationRecord
    validates :title, presence: true 
    validates :artist_name, presence: true
    validates :title, uniqueness: true 
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: {less_than_or_equal_to: 2021}, allow_blank: true
    

    def released? 
        released == true 
    end

    def not_released
        released == false 
    end
end

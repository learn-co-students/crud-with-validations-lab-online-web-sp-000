class Song < ApplicationRecord

    validates :artist_name,
        presence: true
    
    validates :title, 
        presence: true,
        uniqueness: { scope: :release_year }

    validates :released, 
        inclusion: { in: [true, false]}

    validates :release_year, 
        numericality: { only_integer: true }, 
        inclusion: { in: 0000..Date.today.year }, 
        if: :released    
end

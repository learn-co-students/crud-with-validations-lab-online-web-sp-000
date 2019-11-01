class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    
    #validates :boolean_released, inclusion: {in: [true, false]}

end

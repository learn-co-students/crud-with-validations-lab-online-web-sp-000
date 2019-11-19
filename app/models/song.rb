class Song < ApplicationRecord

    validates :title, :released,  presence: true 
    

end

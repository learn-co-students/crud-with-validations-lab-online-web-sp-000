class Song < ApplicationRecord

    validates :title, presence: true
    #Cannot be repeated by the same artist in the same year
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false] }
    # released_year - optional - if released is false
    # released_year - required if released is true
    #validates :relaseed_year,  - must be == or < current year
    

end

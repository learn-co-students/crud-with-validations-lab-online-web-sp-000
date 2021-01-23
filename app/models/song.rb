class Song < ApplicationRecord

    validates :title, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    validates :released, inclusion: [true, false]
    validates_presence_of :release_year, :unless => :released?
    # validates :release_year, 
    # validates :release_year,
    validates :artist_name, presence: true

end

class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :artist_name, presence: true
    validates :genre, presence: true


    validates :release_year, numericality: {less_than: Date.today.year}, :if => :released?

    validates_presence_of :released, :if => :released?



end

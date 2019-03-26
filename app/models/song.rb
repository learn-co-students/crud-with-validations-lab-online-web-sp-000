class Song < ActiveRecord::Base


   validates :title, presence: true
   validates :title, uniqueness: { scope: [:artist_name, :release_year] }
   validates :artist_name, presence: true
   validates :released, inclusion: { in: [true, false] }

end

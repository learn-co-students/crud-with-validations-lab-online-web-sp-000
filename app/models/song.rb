class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name], message: "should not happen more than once per year"} 

    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    
    validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, presence: :true, if: :released 

end

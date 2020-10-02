class Song < ApplicationRecord
    validates :title, presence:true, 
               uniqueness: { scope: [:release_year, :artist_name]}
    # validates :released, acceptance: true
    validates :artist_name, presence:true
    validates :release_year, presence:true, if: ->{released},
               numericality: { only_integer: true, 
               less_than_or_equal_to: ->(_song) { Date.current.year }}

end

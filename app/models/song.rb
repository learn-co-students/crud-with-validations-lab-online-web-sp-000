


class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}
    validates :released, inclusion: { in: [true, false] }
    with_options if: :released? do |released_release_year|
        released_release_year.validates :release_year, presence: true
        released_release_year.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }
    end
    with_options unless: :released? do |unreleased| 
        unreleased.validates :release_year, absence: true, allow_nil: true
    end
    validates :artist_name, presence: true
    
     
    def released?
        released == true
    end

end





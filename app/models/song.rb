class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :released, inclusion: { in: [ true, false ] }
    with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }
    end
    validates :artist_name, presence: true
  
    def released?
      released
    end
  end

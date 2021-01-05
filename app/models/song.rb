class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
    validates :released, inclusion: [true, false]
    validates :release_year, presence: { if: Proc.new {|song| song.released == true} }, numericality: { allow_nil: true, less_than_or_equal_to: Time.now.year } 
    validates :artist_name, presence: true
end

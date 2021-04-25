class Song < ApplicationRecord

    validates :title, :artist_name, presence: true
    validates :title, :artist_name, uniqueness: {scope: :release_year, message: "Cannot be repeated by the same artist in the same year"}
    validates :released, inclusion: [true, false]
end

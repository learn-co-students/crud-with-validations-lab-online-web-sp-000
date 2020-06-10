class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with TitleValidator

    validates :title, presence: :true
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, presence: :true, if: :released 
    validates :artist_name, presence: true 

    # def unique_song
    #     if song = Song.find_by(title: title)
    #         !(song.artist_name == artist_name && song.release_year == release_year)
    #     else 
    #         true 
    #     end 
    # end 

end

# Solution Answers: 
# class Song < ActiveRecord::Base
#     validates :title, presence: true
#     validates :title, uniqueness: {
#       scope: %i[release_year artist_name],
#       message: 'cannot be repeated by the same artist in the same year'
#     }
#     validates :released, inclusion: { in: [true, false] }
#     validates :artist_name, presence: true
  
#     with_options if: :released? do |song|
#       song.validates :release_year, presence: true
#       song.validates :release_year, numericality: {
#         less_than_or_equal_to: Date.today.year
#       }
#     end
  
#     def released?
#       released
#     end
#   end

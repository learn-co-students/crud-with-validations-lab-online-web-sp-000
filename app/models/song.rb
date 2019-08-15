class Same_Song_Same_Year < ActiveModel::Validator

  def validate(record)
    songs_by_artist = Song.all.select { |song| song.artist_name == record.artist_name  }.collect {|song| song.title }
     if songs_by_artist.include?(record.title) && record.release_year <= Time.now.year.to_i
      record.errors[:title] << "Artist already released song this year"
      return false
    else
      return true
    end
  end
end


class Song < ApplicationRecord
  include ActiveModel::Validations

  validates :title, presence: true
  validates :release_year, presence: true, if: :released_true?, 
                           numericality: { less_than_or_equal_to: Time.now.year.to_i }
  validates_with Same_Song_Same_Year                        


  #validator method for release_year
  def released_true?
    self.released
  end
end




# find artist
# see if this artist has this song already
#   if artist has same song, then check if the releas year is equal
#     current year
#     and if this is true, then return false
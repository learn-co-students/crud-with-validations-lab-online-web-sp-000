class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true, if: :released?,
   numericality: { less_than_or_equal_to: Date.today.year}
  validates :artist_name, presence: true
  validate :one_song_per_artist_per_year
  
  
  def one_song_per_artist_per_year
    artist_songs = Song.where("artist_name = '#{self.artist_name}'")
    if artist_songs.map{|s| s.release_year}.include?(self.release_year)
      self.errors[:base] << "#{self.artist_name} already has a song released in #{self.release_year}"
    end
  end
end

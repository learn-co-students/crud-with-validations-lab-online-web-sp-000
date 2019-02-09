class SameYearValidator < ActiveModel::Validator 
  def validate(song)
    if song
      first_song = Song.find_by(title: song.title)
      if first_song
        if first_song.release_year == song.release_year
          song.errors[:title] << "A song with the same title can't be released in the same year."
        end
      end
    end
  end
end

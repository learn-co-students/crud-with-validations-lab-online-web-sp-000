class ReleaseYearValidator< ActiveModel::Validator 
  def validate(song)
    if song
      if song.released 
        if song.release_year == nil 
          song.errors[:release_year] << "A release year is required if a song has been released."
        end
        if song.release_year
          if song.release_year > DateTime.now.year
            song.errors[:release_year] << "A release year must be the current year or a past year."
          end
        end
      end
    end
  end
end
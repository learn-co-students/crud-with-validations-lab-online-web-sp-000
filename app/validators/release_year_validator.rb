class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true
      if !record.release_year 
        record.errors[:release_year] << "The Release year must be entered if song is released."
      elsif record.release_year.to_i < 0
        record.errors[:release_year] << "The Release year must be an integer."
      elsif record.release_year > Date.current.year
        record.errors[:release_year] << "The Release year must be no newer than the current year."
      else
        song = Song.find_by_title(record.title)
        if song && song.release_year == record.release_year
          record.errors[:release_year] << "An artist cannot release the same song twice in a year."
        end
      end
    end
  end
end
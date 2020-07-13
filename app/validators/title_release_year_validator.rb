class TitleReleaseYearValidator < ActiveModel::Validator

  def validate(record)
    song = Song.find_by(title: record.title)
    if song && song.release_year == record.release_year
      record.errors[:release_year] << "Can't release a song twice in the same year!"
    end
  end

end
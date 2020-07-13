class SongYearValidator < ActiveModel::Validator
  def validate(record)
    if Song.find_by(title: record.title, release_year: record.release_year)
      record.errors[:release_year] << "This song has already been released this year."
    end
  end
end

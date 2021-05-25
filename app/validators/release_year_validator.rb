class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released? == true
      if record.release_year == nil
        record.errors[:release_year] << "Song must have a release year if it has been released."
      elsif record.release_year > Time.now.year
        record.errors[:release_year] << "Release year cannot be in the future."
      end
    end
  end
end
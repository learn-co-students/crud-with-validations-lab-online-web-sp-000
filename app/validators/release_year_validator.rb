class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true && !record.release_year.nil?
      if record.release_year >= Date.current.year
        record.errors[:release_year] << "Release year cannot be in the future."
      end
    elsif record.released == true && record.release_year.nil?
      record.errors[:release_year] << "Must have a relase year if released."
    end
  end
end

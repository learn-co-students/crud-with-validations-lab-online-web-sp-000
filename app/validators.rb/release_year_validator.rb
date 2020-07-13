class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    if !!record.released && record.release_year == nil
      record.errors[:release_year] << "Must have a release year" 
    end

    if !!record.release_year && record.release_year >= Time.now.year
      record.errors[:release_year] << "Release Year cannot be in the future"
    end
  end
end
class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    unless !!record.release_year && record.release_year < Time.now.year
      record.errors[:release_year] << "Release year must be less than current year."
    end
  end
end

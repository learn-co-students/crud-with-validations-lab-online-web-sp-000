class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    unless !record.released || (!!record.release_year && record.release_year < Time.new.year)
      record.errors[:release_year] << "Year cannot be later than current year"
    end
  end
end

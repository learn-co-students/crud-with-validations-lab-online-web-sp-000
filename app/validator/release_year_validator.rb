class ReleaseYearValidator < ActiveModel::Validator
  def validate(record)
  #  binding.pry
    if record[:released] == true && record[:release_year] == nil
      record.errors.add :base, "Must have Release Year if it is already released."
    elsif record[:released] == true && record[:release_year] > Time.new.year
      record.errors.add :base, "Release Year cannot be in the future."
    end
  end
end

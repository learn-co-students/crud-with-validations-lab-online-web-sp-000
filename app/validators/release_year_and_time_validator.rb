class ReleaseYearAndTimeValidator < ActiveModel::Validator
  def validate(record)
    current_year = Time.now.to_s.split("-")[0].to_i
    if record.release_year != nil
      unless record.release_year <= current_year 
        record.errors.add :release_year, "must be less than or equal to current year"
      end
    end
  end
end

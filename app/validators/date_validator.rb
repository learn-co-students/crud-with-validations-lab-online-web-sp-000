class DateValidator < ActiveModel::Validator
    def validate(record)
      unless record.release_year == nil || record.release_year < Date.today.year
        record.errors[:release_year] << "Can't be released in the future."
      end
    end
  end
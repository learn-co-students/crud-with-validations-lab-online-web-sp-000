class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.released
            if record.release_year
                if record.release_year > Date.today.year
                    record.errors.add :base, "The year must be less than or equal to current year."
                end
            else
                record.errors.add :base, "You must enter a year."
            end
        end
      end
end
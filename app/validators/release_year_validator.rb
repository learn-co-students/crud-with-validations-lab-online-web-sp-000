class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if !!record.released && record.release_year.nil?
            record.errors[:release_year] << "Must enter a valid release year"
        else
            unless record.release_year.nil? || record.release_year.to_i <= Time.now.year.to_i
                record.errors[:release_year] << "Invalid Release Year"
            end
        end

    end
end
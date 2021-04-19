class ReleaseYearValidator < ActiveModel::Validator

    def validate(record)
        if record.release_year.to_i > Date.current.year
            record.errors[:release_year] << "must be a valid year" 
        elsif record.released == true && record.release_year == nil
            record.errors[:release_year] << "must enter a release year"
        end
    end

end
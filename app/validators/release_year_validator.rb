class ReleaseYearValidator < ActiveModel::Validator 
    def validate(record)
        if record.released && !record.release_year
            record.errors[:release_year] << "Must have release year for a released record."
        elsif record.released && record.release_year.to_i > Time.now.year
            record.errors[:release_year] << "Release year cannot be in the future."
        end
    end
end
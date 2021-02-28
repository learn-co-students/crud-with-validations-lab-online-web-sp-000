class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        year = DateTime.now.year

        unless record.released == false
            if record.release_year.nil?
                record.errors[:release_year] << "Must include release year if song was released"
            elsif record.release_year > year
                record.errors[:release_year] << "Release year must be on or before current year"
            end
        end

    end
end
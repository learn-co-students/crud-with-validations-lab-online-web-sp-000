class ReleaseYearValidator < ActiveModel::Validator 
    def validate(record)
        unless ( !record.released || (record.release_year && record.release_year <= 2021))
            record.errors[:release_year] << "Release Year must exist and be earlier than or equal to the current year"
        end
    end
end
class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        binding.pry
        unless record.release_year.equals?(true)
            record.errors[:release_year] << "This does not have release year"
        end
    end
end
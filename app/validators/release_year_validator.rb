class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.release == true
            validates :release_year, presence: true            
        end
    end
end
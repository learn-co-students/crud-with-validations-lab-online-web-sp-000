class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
      #if record.released == true
        unless record.release_year.to_s <= Date.today.to_s
          record.errors[:release_year] << "This release year is invalid."
        end
      end
    #end
end
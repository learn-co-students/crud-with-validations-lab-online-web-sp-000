class ReleaseYearValidator < ActiveModel::Validator
  
    def validate(record)
            if record.release_year != nil
                if record.released == true && record.release_year <= 2020 
                   true
                else
                    record.errors[:release_year] << "Must be less than or equal to the current year"
                    false
                end
            elsif  record.released == false
                true
            else
                record.errors[:release_year] << "Must be less than or equal to the current year"
                false

            end
        end
  end

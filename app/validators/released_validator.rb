class ReleasedValidator < ActiveModel::Validator
    
    def validate(record)
        # record.errors[:released] << record.released.to_s
            if record.released == true || record.released == false
               true
            else
                record.errors[:released] << "Must be true or false"
               
            end
        end
  end

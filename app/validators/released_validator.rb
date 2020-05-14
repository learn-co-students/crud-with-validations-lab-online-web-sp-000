class ReleasedValidator < ActiveModel::Validator

  def validate(record)
    unless record.released == true || record.released == false
      record.errors[:released] << "The released attribute can only be true or false."
    end
  end
  
end

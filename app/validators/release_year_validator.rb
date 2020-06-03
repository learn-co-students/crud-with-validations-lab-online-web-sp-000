class ReleaseYearValidator < ActiveModel::Validator  
   def validate(record)
      if record.release_year && record.release_year > 2020
         record.errors[:release_year] << "Needs to be current year or less!"
      end 
   end 
end 
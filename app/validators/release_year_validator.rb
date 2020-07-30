class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
      if (record.released == true) && (record.release_year == "" || record.release_year == nil)
        record.errors[:release_year] << "cannot be blank if released is TRUE!"
      end
      if record.release_year.to_i > Time.now.year
        record.errors[:release_year] << "cannot be in the future!"
      end      
    end
  end
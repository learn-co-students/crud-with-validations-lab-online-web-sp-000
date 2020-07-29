class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        #binding.pry

        if record.release_year == nil && record.released == false
        
        elsif record.release_year == nil && record.released == true

            record.errors[:release_year] << "Not a valid release"

        elsif record.released == true && record.release_year <= Time.now.year
            
        else
            record.errors[:release_year] << "Not a valid release"
        end
    end
end
class  ReleaseYearValidator < ActiveModel::Validator 

    def validate(record)
        if record.released == true
            unless record.release_year && record.release_year <= Time.now.year #unless not nil and not in future
                record.errors[:release_year] << "Release year can't be blank if the song is released"
            end
        end

    end
end

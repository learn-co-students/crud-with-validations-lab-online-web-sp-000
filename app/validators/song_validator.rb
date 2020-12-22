class SongValidator < ActiveModel::Validator
    def validate(record)
        unless record.released == true || record.released == false
            record.errors[:released] << "Must be true or false!"
        end

        if record.released == true && (record.release_year == nil || record.release_year > Time.new.year)
            record.errors[:release_year] << "Must have a release year that is in the past!"
        end

        record.artist_year = record.set_artist_year

    end
end
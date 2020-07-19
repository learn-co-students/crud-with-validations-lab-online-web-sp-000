class SongValidator < ActiveModel::Validator
    def validate(record)
        match_array = record.class.all.select {|s| s.artist_name == record.artist_name && s.release_year == record.release_year && s.title == record.title}
        unless match_array.empty?
            record.errors[:title] << "An artist cannot release the same song twice in one year."
        end
        if record.released == true && record.release_year == nil
            record.errors[:release_year] << "If released is true, there must be a year of release."
        end
        if record.release_year != nil && record.release_year > DateTime.now.year
            record.errors[:release_year] << "Release year cannot be in the future."
        end
    end
end
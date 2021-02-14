class TitleValidator < ActiveModel::Validator
    def validate(record)
        if !!Song.find_by(:title => record.title, :artist_name => record.artist_name, :release_year => record.release_year)
            record.errors[:title] << "Song already exists for this artist in this year."
        end
    end
end  
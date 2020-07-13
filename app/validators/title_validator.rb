class TitleValidator < ActiveModel::Validator
    def validate(record)
        if song = Song.find_by(title: record.title)
            if song.artist_name == record.artist_name && song.release_year == record.release_year
                record.errors[:title] << "Title is invalid if an artist tries to release the same song twice in a year"
            end 
        end 
    end

end
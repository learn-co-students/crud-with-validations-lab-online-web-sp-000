class SongValidator < ActiveModel::Validator 
    def validate(record)
        Song.all.each do |song| 
            if song.title == record.title && song.release_year == record.release_year && song.id != record.id
                record.errors[:title] << "Cannot release two songs with same title in the same year."
            end
        end
    end 
end 
class DuplicateValidator < ActiveModel::Validator 
    def validate(record)
        good = true
        art = record.artist_name
        art_songs = []
        Song.all.each do | song |
            if song.artist_name == art
                art_songs << song
            end
        end
        art_songs.each do | song |
            if song.released
                if song.release_year == record.release_year
                    good = false
                end
            end
        end
        #binding.pry
        unless (good)
            record.errors[:artist_name] << "Artist can't release two songs in one year... apparently"
        end
    end
end
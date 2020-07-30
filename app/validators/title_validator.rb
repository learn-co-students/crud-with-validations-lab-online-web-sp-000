class TitleValidator < ActiveModel::Validator
    def validate(record)
      if (record.title == "" || record.title == nil)
        record.errors[:title] << "cannot be blank!"
      end
      songs = Song.all
      songs.each do |song|
        if (song.title == record.title) && (song.release_year == record.release_year.to_i)
            record.errors[:title] << "cannot release two songs with identical titles in the same year!"
        end
      end
    end
  end
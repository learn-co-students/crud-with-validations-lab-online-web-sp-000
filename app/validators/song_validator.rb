class SongValidator < ActiveModel::Validator

    def no_dupes(record)
        @song = Song.all
        if (@song.title == record.title && @song.artist_name == record.artist_name && @song.release_year == record.release_year)
            record.errors[:release_year] << "sorry, no Dupes DUUUUUUUUUUUUDE!"
        end
    end

    def we_dont_time_travel(record)
        if record.release_year.present? && release_year > Date.today.year
            record.errors << "This isnt't Bill and Teds Excelent Adventure Buddy!"
        end
    end
end
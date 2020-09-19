class TitleValidator < ActiveModel::Validator

    def validate(record)
        @finder = Song.find_by(artist_name: record.artist_name, release_year: record.release_year, title: record.title)
        if @finder != nil
            unless @finder.id == record.id
            record.errors[:category] << "Be more original."
            end
        end
    end
end
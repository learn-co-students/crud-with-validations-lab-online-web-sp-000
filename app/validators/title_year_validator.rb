class TitleYearValidator < ActiveModel::Validator
    def validate(record)
        year_titles = Song.all.select {|r| r.release_year == record.release_year}.collect {|r| r.title}

        unless !year_titles.include?(record.title)
            record.errors[:title] << "Song has already been released that year"
        end
    end
end
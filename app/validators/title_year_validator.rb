class TitleYearValidator < ActiveModel::Validator
    def validate(record)
        titles_of_year = Song.all.select{|s| s.release_year == record.release_year}.map{|y| y.title}

        unless !titles_of_year.include?(record.title)
            record.errors[:title] << "Song cannot be released twice in one year by the same artist"
        end
    end
end
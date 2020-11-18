class Song < ApplicationRecord
    # TITLE
    validates :title, :artist_name, presence: true

    # RELEASED
    # validates :released, inclusion: { in: [true, false] } << FOR BOOLEAN VALUES

    # with a conditional validation: if the song is released then the
    # release year needs to be validated
    validates :release_year, presence: true, if: :released
    validate :release_date_validation
    validate :title_uniqueness_validation
    
    def release_date_validation
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year mustn't be in the future")
        end
    end

    def title_uniqueness_validation 
        Song.all.each do |song|
            if song.title == title && song.release_year == release_year && song.artist_name == artist_name
                errors.add(:title, "can't be repeated by the same artist in the same year")
            end
        end
    end

    # validate :release_year_validation
    # RELEASE YEAR
    # Look at 6.2 Custom Methods
    # implement the error method in this Song Class
    # If :released == "false"
    #   it can be entered but doesn't need to be validated
    # elsif released == "true"
    #   presence needs to be validated
    # IT ALSO MUST BE == OR LESS THAN THE CURRENT YEAR

    # vv MY FIRST ATTEMPT WITH CUSTOM VALIDATION vv
    # def release_year_validation 
    #     if :released == "true"
    #         validates :release_year, presence: true if :release_year == nil || :release_year == ""
    #     end
    # end
    
end

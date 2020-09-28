require_relative '../models/song'

class TitleValidator < ActiveModel::Validator
    
    def validate(record)
        song = Song.all.select{|song| song.title == record.title && song.artist_name == record.artist_name}
        if song.size > 0
                 record.errors[:title] << "Cannot be repeated by the same artist in the same year"
            else
                true
            end
        end
  end

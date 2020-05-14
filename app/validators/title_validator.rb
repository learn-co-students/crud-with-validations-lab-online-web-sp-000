class TitleValidator < ActiveModel::Validator

  def validate(record)
    duplicates = Song.all.select{|song| song.artist_name == record.artist_name && song.release_year == record.release_year && song.title == record.title}
    unless duplicates.size == 0
      record.errors[:title] << "This song has already been released by this artist in this year."
    end
  end

end

class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless one_match_or_less(record)
      record.errors[:title] << "Artist already has song of that title for this year"
    end
  end

  def one_match_or_less(record)
    matches = matching_songs(record).length
    if record.persisted?
      matches < 2
    else
      matches < 1
    end
  end
  def matching_songs(record)
    Song.all.find_all do |song|
      song.title == record.title && song.artist_name == record.artist_name && song.release_year == record.release_year
    end
  end
end

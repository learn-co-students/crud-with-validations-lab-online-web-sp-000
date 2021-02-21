class TitleValidator < ActiveModel::Validator
  def validate(record)
  song = Song.find_by(title: record.title, artist_name: record.artist_name, release_year: record.release_year)
    if !song.nil?
      record.errors[:messages] << "Cannot re-release the same song in the same year."
    end
  end
end

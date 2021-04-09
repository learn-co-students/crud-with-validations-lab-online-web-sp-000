class ArtistAndReleaseYearValidator < ActiveModel::Validator
  def validate(record)
    unless Song.find_by(artist_name: record.artist_name, release_year: record.release_year, title: record.title) == nil
      record.errors[:title] << "cannot be repeated by the same artist in the same year"
    end
  end
end
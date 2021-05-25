class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title == nil
      record.errors[:title] << "Title cannot be blank."
    elsif record.class.all.any?{ |song| song.title == record.title && song.release_year == record.release_year && song.artist_name == record.artist_name}
      record.errors[:title] << "Songs released the same year cannot share a title."
    end
  end
end
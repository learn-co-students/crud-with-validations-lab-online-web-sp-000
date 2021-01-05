class DuplicateValidator < ActiveModel::Validator
  def validate(record)
    #binding.pry
    dupe = Song.find_by(title: record[:title])
    #binding.pry
    #there is another song with the same name that is also released in the same year
    if dupe != nil && dupe.release_year == record[:release_year]
      record.errors.add :base, "There is already a song by this name released this year."
    end
  end
end

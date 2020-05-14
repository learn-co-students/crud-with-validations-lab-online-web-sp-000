class ReleaseYearValidator < ActiveModel::Validator

  def validate(record)

    if record.release_year.nil?
      if record.released == true
        record.errors[:release_year] << "If a record is released, its release year cannot be blank!"
      end
    else
      if record.release_year > Time.now.year
        record.errors[:release_year] << "Cannot enter a song in the database with a release date in the future."
      end
    end

  end

end

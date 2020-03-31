class TitleValidator < ActiveModel::Validator
  def validate(record)
    if Song.all.select { |song| song.title == record.title && song.release_year == record.release_year }.size > 0
      record.errors[:title] << "That artist already has a song by that name in that year"
    end
  end
end

class YearValidator < ActiveModel::Validator
  def validate(record)
    if record.released == true
      if record.release_year.nil? || record.release_year > Time.now.year
        record.errors[:release_year] << "That year is invalid."
      end
    end
  end
end

class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist_name, presence: true
  validates_with TitleValidator
  validates_with YearValidator
end

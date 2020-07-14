class TitleValidator < ActiveModel::Validator
	def validate(record)
		same_song = Song.all.any? do |song|
			song.title == record.title &&
			song.release_year == record.release_year &&
			song.artist_name == record.artist_name
		end

		if same_song
			record.errors[:title] << "Song title already exists from same artist in same year"
		end
	end
end
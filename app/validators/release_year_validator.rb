class ReleaseYearValidator < ActiveModel::Validator
	def validate(record)
		if record.release_year
			if record.release_year > Time.now.year
				record.errors[:release_year] << "Release year cannot be greater than current year"
			end
		end
	end
end
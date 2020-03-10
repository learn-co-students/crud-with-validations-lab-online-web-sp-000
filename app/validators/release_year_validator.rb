# class ReleaseYearValidator < ActiveModel::Validator
#   def validate(record)
#     if record.released == true
#       if record.release_date.class != "Integer"
#         record.errors[:release_date] << "The Release date must be no newer than the current year."
#       elsif record.release_date

#       end
#     end
#   end
# end
class Song < ApplicationRecord
  validates_presence_of :title
  validates_inclusion_of :released, in: [true, false]

  with_options if: :released do |t|
    # t.validates_presence_of :release_year
    t.validates_numericality_of :release_year, less_than_or_equal_to: Time.new.year
    t.validates_uniqueness_of :title, scope: :release_year
  end

end

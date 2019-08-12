class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :release_year, presence: true, if: :released_true?


  validates :artist_name, presence: true


  def released_true?
    released == true
  end

end

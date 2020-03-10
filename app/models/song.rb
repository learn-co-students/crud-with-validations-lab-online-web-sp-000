class Song < ApplicationRecord
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?, numericality: { 
    only_integer: true, 
    less_than_or_equal_to: ->(_brewery) { Date.current.year }
  }
  validates :artist_name, presence: true

  def released?
    if self.released == true
      true
    else
      false
    end
  end
end

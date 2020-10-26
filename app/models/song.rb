class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true

end

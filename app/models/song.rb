class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: %w(True False) }

end
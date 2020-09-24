class Song < ActiveRecord::Base

  def released?
    released
  end

  validates :title, presence: true
  validates :artist_name, presence: true
  validates :released, inclusion: { in: %w(true false) }
    with_options if: :released? do |released|
      released.validates :release_year, presence: true
      released.validates :release_year, numericality: { less_than: Time.now.year }
  end

end
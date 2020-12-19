class Song < ActiveRecord::Base
     validates :title, presence: true
     validates :artist_name, presence: true
     validates :title, uniqueness: { scope: :release_year, message: "should happen once per year" }
    # validates :released, allow_nil: false
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than: 2021 }, allow_nil: true

end

class Song < ActiveRecord::Base
    # include ActiveModel::Validations
    validates :title, presence: true
    # validates_with ReleaseYearValidator
    # validates :release_year, presence: true, if: :is_released?

    

    validates :released, inclusion: { in: [true, false]}

    with_options if: :is_released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { }
    end
    # validates :release_year,
    #     presence: true,
    #     if: :released?
        # uniqueness: true,
        # inclusion: { in: 1900..Date.today.year }
    # validates :artist_name, presence: true

    def is_released?
        released == true
    end
end

class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:release_year, :artist_name]}
    validates :artist_name, presence: true
    validates :released, inclusion: [true, false]
    validates :release_year, presence: true, if: :released_is_true?
    validates :release_year, numericality: { less_than_or_equal_to: 2020}, allow_nil: true
  
      def released_is_true?
        released
      end
  end
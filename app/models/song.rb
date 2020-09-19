class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with TitleValidator

    validates :title, length: {minimum: 1}
   
   validates :release_year, presence: true,
            if: [Proc.new { |c| c.released == true}]
    validates :release_year, numericality: { less_than_or_equal_to: ->(_song) { Date.current.year } }, 
            if: [Proc.new { |a| a.released == true}]
        
end

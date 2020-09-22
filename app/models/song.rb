class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: :release_year }
    validates_inclusion_of :released, :in => [true, false]
    validates :release_year, presence: true, if: :released?, numericality: { less_than_or_equal_to: Time.now.year,  only_integer: true }
    
    def released?
        self.released == true
    end 

    def early?
        binding.pry
        self.release_year < Time.now.year
    end 

end

class Song<ActiveRecord::Base
    validates :title, presence: true
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: {less_than: Time.now.year}, allow_nil: true
    validates :title, uniqueness: { scope: :release_year,
    message: "should happen once per year" }
   

    
    


end 
class Song < ApplicationRecord
  validates :title, presence: true
  validates :released, inclusion: { in: [ true, false ] }
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: :released
  validates :release_year, numericality: { only_integer: true, less_than_or_equal_to: Date.current.year }, if: :release_year
  validates :title, uniqueness: {scope: :release_year}

end



# title, a string
# Cannot be repeated by the same artist in the same year


# class Order < ApplicationRecord
#   validates :card_number, presence: true, if: :paid_with_card?
#
#   def paid_with_card?
#     payment_type == "card"
#   end
# end

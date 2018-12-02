class Song < ActiveRecord::Base
  validates :title, presence: true

  def same_artist_and_year
    @title  = :title
    binding.pry
  end
  

end




# validates :title, presence: true
#   validates :content, length: { minimum: 100 }
#   validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

# Cannot be repeated by the same artist in the same year

# class Computer < ApplicationRecord
#   validates :mouse, presence: true,
#                     if: [Proc.new { |c| c.market.retail? }, :desktop?],
#                     unless: Proc.new { |c| c.trackpad.present? }
# end


# class Order < ApplicationRecord
#   validates :card_number, presence: true, if: :paid_with_card?
#
#   def paid_with_card?
#     payment_type == "card"
#   end
# end
#
# def same

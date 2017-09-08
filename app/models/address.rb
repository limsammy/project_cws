class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  # def total_amount
  #   sum = 0
  #   order_items.each.do |i|
  #     sum= sum +  i.amount.to_i  
  #   end
  #   return sum
  # end
   
end

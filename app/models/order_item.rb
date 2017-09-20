class OrderItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true
  validates :quantity, :unit_price, :amount, presence: true
end

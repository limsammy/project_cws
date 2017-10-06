class OrderItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true
  validates :quantity, :unit_price, :amount, presence: true

  after_save :update_product_quantity

  def update_product_quantity
    product = Product.find(self.product_id)
    quantity_left = product.stock_in_hand - self.quantity
    product.update_attributes(stock_in_hand: quantity_left)
  end
end

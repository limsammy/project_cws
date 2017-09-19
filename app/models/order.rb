class Order < ApplicationRecord
	belongs_to :company, optional: true
	belongs_to :client, optional: true
	has_many :order_items, dependent: :destroy
  has_one :shipping_address, class_name: "Address", as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :shipping_address
	accepts_nested_attributes_for :order_items,  allow_destroy: true
  validates :order_number, :order_description, :order_at, presence: true



	def total_amount
		total = 0
			order_items.each do |i|
				total += i.amount.to_i
			end
		return total
  end
end

class Order < ApplicationRecord
  enum status: [ 'ordered', 'paid', 'cancelled', 'completed' ]
	belongs_to :company, optional: true
	belongs_to :client, optional: true
	has_many :order_items, dependent: :destroy
  has_one :shipping_address, class_name: "Address", as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :shipping_address
	accepts_nested_attributes_for :order_items,  allow_destroy: true
  validates :order_number, :order_description, :ordered_at, presence: true
  after_save :set_total_amt

	def total_amount
		total = 0
			order_items.each do |i|
				total += i.amount.to_f
			end
		return total
  end

  def set_total_amt
    update_column(:total_amount, total_amount)
  end
end

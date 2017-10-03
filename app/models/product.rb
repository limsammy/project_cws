class Product < ApplicationRecord
	has_many :order_items, dependent: :destroy
	accepts_nested_attributes_for :order_items,  allow_destroy: true
  validates :name, :price, :stock_in_hand, presence: true
  validates :code, presence: true, uniqueness: true
  belongs_to :category
end

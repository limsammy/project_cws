class Order < ApplicationRecord
	has_many :products, dependent: :destroy
	belongs_to :company
end

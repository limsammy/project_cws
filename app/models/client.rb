class Client < ApplicationRecord
 has_one :address, as: :addressable, dependent: :destroy
 has_many :orders, dependent: :destroy
 accepts_nested_attributes_for :address
end

class Customer < ApplicationRecord
  validates :name, :fax , :phone_number, presence: true
  validates :phone_number, length: { minimum:10 ,maximum: 15 }, presence: true
  # has_many :users, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :billing_address, -> { where addressable_type: "BillingAddress"},
     class_name: Address, foreign_key: :addressable_id,
     foreign_type: :addressable_type, dependent: :destroy
  has_one :shipping_address, -> { where addressable_type: "ShippingAddress"},
     class_name: Address, foreign_key: :addressable_id,
     foreign_type: :addressable_type, dependent: :destroy
  has_one :additional_address, -> { where addressable_type: "AdditionalAddress"},
     class_name: Address, foreign_key: :addressable_id,
     foreign_type: :addressable_type, dependent: :destroy
  accepts_nested_attributes_for :shipping_address, allow_destroy: true
  accepts_nested_attributes_for :billing_address, allow_destroy: true
  accepts_nested_attributes_for :additional_address, allow_destroy: true
  accepts_nested_attributes_for :contacts,  allow_destroy: true
end

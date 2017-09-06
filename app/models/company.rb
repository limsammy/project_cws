class Company < ApplicationRecord
  has_many :users
  has_many :clients
  has_many :orders, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end

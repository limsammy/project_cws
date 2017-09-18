class Company < ApplicationRecord
  validates :name, :fax , :phone_number, presence: true
  validates :phone_number, length: { maximum: 10 }, presence: true
  has_many :users, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :clients, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end

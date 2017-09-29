class Customer < ApplicationRecord
  validates :name, :fax , :phone_number, presence: true
  validates :phone_number, length: { minimum:10 ,maximum: 15 }, presence: true
  has_many :users, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :address, class_name: "Address", as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :contacts,  allow_destroy: true
  accepts_nested_attributes_for :address
end

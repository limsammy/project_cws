class Company < ApplicationRecord
  validates :name, :fax , presence: true
  has_many :users
  has_many :clients
  has_many :orders, dependent: :destroy
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address
end

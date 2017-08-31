class Company < ApplicationRecord
  has_many :users
  has_many :clients
  has_one :address, as: :addressable, dependent: :destroy
end

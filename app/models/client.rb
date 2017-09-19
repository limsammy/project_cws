class Client < ApplicationRecord
	has_one :address, as: :addressable, dependent: :destroy
	has_many :orders, dependent: :destroy
	accepts_nested_attributes_for :address
	validates :name, presence: true
	validates :mob_number, length: { minimum:10, maximum:15}, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
	                  format: { with: VALID_EMAIL_REGEX },
	                  uniqueness: true
end

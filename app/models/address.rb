class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true
  validates :line_1, :country,  presence: true
  validates :zip, presence: true#,  numericality: { only_integer: true }
end

class AddOrderAtToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_at, :datetime
  end
end

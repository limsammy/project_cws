class AddAmountToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :amount, :decimal, null: false
  end
end

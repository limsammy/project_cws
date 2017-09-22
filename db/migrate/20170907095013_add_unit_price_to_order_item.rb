class AddUnitPriceToOrderItem < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :unit_price, :decimal, null: false
  end
end

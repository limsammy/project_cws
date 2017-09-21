class ChangeOrderNumberFromOrder < ActiveRecord::Migration[5.1]
  def change
    change_column :orders, :order_number, :string
  end
end

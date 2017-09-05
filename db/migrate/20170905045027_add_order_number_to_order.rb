class AddOrderNumberToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_number, :integer

    add_column :orders, :order_detail, :string
  end
end

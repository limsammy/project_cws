class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :order_number, null: false
      t.string  :description, null: false
      t.belongs_to :company, foreign_key: true, index: true
      t.belongs_to :client, foreign_key: true, index: true
      t.timestamps
    end
  end
end

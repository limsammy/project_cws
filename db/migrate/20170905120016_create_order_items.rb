class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false
      t.belongs_to :order, foreign_key: true, index: true
      t.belongs_to :product, foreign_key: true, index: true
      t.timestamps
    end
  end
end

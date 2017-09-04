class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :code
      t.float :quantity
      t.datetime :last_order
      t.integer :recorder_type
      t.timestamps
    end
  end
end

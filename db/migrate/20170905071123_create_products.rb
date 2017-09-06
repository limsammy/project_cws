class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.belongs_to :company, foreign_key: true, index: true
      t.decimal :price, precision: 10, scale: 5, null: false
      t.integer :stock_in_hand, default: 0
      t.timestamps
    end
    add_index :products, [:code, :company_id], unique: true
  end
end

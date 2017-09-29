class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :item_code
      t.string :cover_slip
      t.string :note
      t.timestamps
    end
  end
end

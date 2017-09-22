class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :email
      t.string :mob_number, null: false
      t.timestamps
    end
  end
end

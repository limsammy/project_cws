class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :department
      t.integer :phone_number
      t.integer :fax
      t.timestamps
    end
  end
end

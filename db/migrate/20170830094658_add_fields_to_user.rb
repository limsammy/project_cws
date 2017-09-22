class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :off_phone, :integer
    add_column :users, :mob_no, :string
    add_column :users, :department, :string
    add_column :users, :department_phone, :string
  end
end

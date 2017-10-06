class AddFieldToContact < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :title, :string
    add_column :contacts, :department, :string
    add_column :contacts, :fax, :string
  end
end

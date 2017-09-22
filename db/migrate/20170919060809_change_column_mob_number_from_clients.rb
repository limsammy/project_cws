class ChangeColumnMobNumberFromClients < ActiveRecord::Migration[5.1]
  def change
    change_column :clients, :mob_number, :string
  end
end

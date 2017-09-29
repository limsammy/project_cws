class RenameCompanyToClient < ActiveRecord::Migration[5.1]
  def change
    rename_table :companies, :customers
  end

  def self.down
    rename_table :customers, :companies
  end
end

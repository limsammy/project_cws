class RenameClientsToContacts < ActiveRecord::Migration[5.1]
  def self.up
    rename_table :clients, :contacts
  end

  def self.down
    rename_table :contacts, :clients
  end
end

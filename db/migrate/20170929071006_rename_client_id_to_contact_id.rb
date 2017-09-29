class RenameClientIdToContactId < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :client_id, :contact_id
  end
end

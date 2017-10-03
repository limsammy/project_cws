class RenameCompanyIdInContact < ActiveRecord::Migration[5.1]
  def change
    rename_column :contacts, :company_id, :customer_id
  end
end

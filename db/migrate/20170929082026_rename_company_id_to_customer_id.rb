class RenameCompanyIdToCustomerId < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :company_id, :customer_id

  end
end

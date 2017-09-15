class AddCompanyIdToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :company_id, :integer
  end
end

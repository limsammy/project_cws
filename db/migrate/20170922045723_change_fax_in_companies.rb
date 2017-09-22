class ChangeFaxInCompanies < ActiveRecord::Migration[5.1]
  def change
    change_column :companies, :fax, :string
  end
end

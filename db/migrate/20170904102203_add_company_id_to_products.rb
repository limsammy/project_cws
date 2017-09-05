class AddCompanyIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :order_id, :integer
  end
end

class AddCityToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :city, :string
  end
end

class ChangePhoneNumberFromCompanies < ActiveRecord::Migration[5.1]
  def change
    change_column :companies, :phone_number, :string
  end
end

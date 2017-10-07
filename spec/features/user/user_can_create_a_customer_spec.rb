require 'rails_helper'

describe "User logs in and creates a customer" do
  context "user visits the Customers#Create page" do
    scenario "user saves customer and customer is stored to database" do
      user = User.create!(email: 'example@mail.com', password: '123456')

      visit root_path

      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password

      click_on "Log in"

      click_on "Customers"
      click_on "Create Customer"

      expect(current_path).to eq(new_customer_path)

      fill_in "customer[name]", with: 'Yale Medical Center'
      fill_in "customer[phone_number]", with: '5039392923'
      fill_in "customer[fax]", with: '5039392923'
      fill_in "customer[department]", with: 'Pathology'

      click_on "Add contact"

      show_page
      expect(page).to have_content("Contact")
      expect(page).to have_content("Name")
    end
  end
end

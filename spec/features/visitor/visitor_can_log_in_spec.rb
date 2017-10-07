require 'rails_helper'

describe "Visitor can log in" do
  context "visitor tries to visit website" do
    scenario "user clicks signs in and state is saved" do
      user = User.create!(email: 'example@mail.com', password: '123456')

      visit root_path

      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: user.password

      click_on "Log in"

      expect(current_path).to eq(root_path)
      expect(page).to have_content('Dashboard')
    end
  end
end

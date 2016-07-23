require 'rails_helper'

RSpec.feature "User can log in" do
  context "with valid login details" do
    scenario "a registered user visits the root path" do
      user = User.create(username: 'Ryan', email: 'ryan@example.com', password: 'password')

      visit root_path

      click_on "Login"
      fill_in "Username", with: user.username
      fill_in "Password", with: 'password'
      click_button "Login"

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome, #{user.username}!")
      expect(page).to have_link("Logout", href: logout_path)
    end

    scenario "an unregistered user visits the root path" do
      visit root_path

      click_on "Login"
      fill_in "Username", with: 'Ryan'
      fill_in "Password", with: 'password'
      click_button "Login"

      expect(page).to have_content("Username or password incorrect")
      expect(page).not_to have_content("Welcome, Ryan!")
    end
  end

  context "with invalid login details" do
    scenario "a registered user visits the root path" do
      user = User.create(username: 'Ryan', email: 'ryan@example.com', password: 'password')

      visit root_path

      click_on "Login"
      fill_in "Username", with: user.username
      fill_in "Password", with: 'incorrect'
      click_button "Login"

      expect(page).to have_content("Username or password incorrect")
    end
  end
end

require 'rails_helper'

RSpec.feature "User can log out" do
  scenario "logged-in user visits the gifs page" do
    login_user

    visit gifs_path
    click_on "Logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Logged out successfully")
    expect(page).not_to have_link("Logout", href: logout_path)
    expect(page).not_to have_content("Welcome, Ryan!")
    expect(page).to have_link("Login", href: login_path)
    expect(page).to have_link("Create Account", href: new_user_path)
  end
end

def login_user
  User.create(username: 'Ryan', email: 'ryan@example.com', password: 'password')

  visit login_path
  fill_in "Username", with: "Ryan"
  fill_in "Password", with: "password"
  click_button "Login"
end

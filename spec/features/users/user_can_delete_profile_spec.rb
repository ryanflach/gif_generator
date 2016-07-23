require 'rails_helper'

RSpec.feature "User can delete their profile" do
  scenario "logged-in user visits their account page" do
    login_user

    visit user_path(User.first)
    click_on "Delete Profile"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Profile deleted successfully")
    expect(page).not_to have_content("Welcome, Ryan!")

    click_on "Login"
    fill_in "Username", with: "Ryan"
    fill_in "Password", with: 'password'
    click_button "Login"

    expect(page).to have_content("Username or password incorrect")
  end
end

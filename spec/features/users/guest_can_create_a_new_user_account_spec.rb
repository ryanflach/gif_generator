require 'rails_helper'

RSpec.feature "Guest can create a new user account" do
  context "With valid username and email" do
    scenario "A guest visits the root path" do
      visit root_path

      click_on "Create Account"

      expect(current_path).to eq(new_user_path)

      fill_in "Username", with: 'Ryan'
      fill_in "Email", with: 'ryan@example.com'
      fill_in "Password", with: 'password'
      click_button "Create User"

      expect(current_path).to eq(gifs_path)
      expect(page).to have_content("Account created successfully!")
      expect(page).to have_content("Welcome, Ryan!")
      expect(page).to have_link("Logout", href: logout_path)
      expect(page).not_to have_link("Login", href: login_path)
      expect(page).not_to have_link("Create Account", href: new_user_path)
    end
  end

  context "With invalid username and/or email" do
    scenario "A guest visits the root path" do
      user = create(:user)

      visit root_path

      click_on "Create Account"
      fill_in "Username", with: user.username
      fill_in "Email", with: 'ryan@example.com'
      fill_in "Password", with: 'password'
      click_button "Create User"

      expect(page).to have_content("Username has already been taken")
    end
  end
end

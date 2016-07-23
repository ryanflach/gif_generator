require 'rails_helper'

RSpec.feature "User can edit their account" do
  context "they supply valid information" do
    scenario "logged-in user visits the root path" do
      user = create(:user)
      old_name = user.username

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path
      click_on "Account"

      expect(current_path).to eq(user_path(user))

      click_on "Edit Profile"

      expect(current_path).to eq(edit_user_path(user))

      fill_in "Username", with: "New Name"
      click_button "Update User"

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Profile updated successfully")
      expect(page).to have_content("Welcome, New Name!")
      expect(page).not_to have_content("Welcome, #{old_name}!")
    end
  end

  context "they supply invalid information" do

  end
end

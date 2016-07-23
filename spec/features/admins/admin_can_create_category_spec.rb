require 'rails_helper'

RSpec.feature "Admin can create a category" do
  context "with valid category name" do
    scenario "logged-in admin visits the root path" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit root_path
      click_on "Categories"
      click_on "Create Category"
      fill_in "Name", with: "Sports"
      click_button "Create Category"

      expect(current_path).to eq(admin_category_path(Category.first))
      expect(page).to have_content("Sports")
    end
  end

  context "with invalid category name" do
    scenario "logged-in admin visits the admin categories path" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      category = create(:category)

      visit admin_categories_path
      click_on "Create Category"
      fill_in "Name", with: category.name
      click_button "Create Category"

      expect(page).to have_content("Name has already been taken")
    end
  end

end

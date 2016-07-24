require 'rails_helper'

RSpec.feature "Admin can create a gif" do
  context "Category already exists" do
    scenario "logged-in admin visits admin categories page" do
      admin = create(:admin)
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      click_on "Add GIF"
      select category.name, from: "Category"
      click_button "Generate GIF"

      expect(current_path).to eq(admin_category_path(category))
      expect(page).to have_css("img")
    end

    scenario "logged-in admin visits existing category page" do
      admin = create(:admin)
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_category_path(category)
      click_on "Add GIF"

      expect(page).to have_css("img")
    end
  end

  context "Category does not yet exist" do
    scenario "logged-in admin visits admin categories page" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path
      click_on "Add GIF"
      fill_in "Category", with: "fun"
      click_button "Generate GIF"

      expect(current_path).to eq(admin_category_path(Category.find_by(name: 'fun')))
      expect(page).to have_css("img")
    end
  end
end

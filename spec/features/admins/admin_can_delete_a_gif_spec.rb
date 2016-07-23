require 'rails_helper'

RSpec.feature "Admin can delete a gif" do
  scenario "logged-in user visits the admin categories page" do
    admin = create(:admin)
    gif = create(:gif)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    click_on gif.category.name
    page.find(".#{gif.category.name}-image-1").click_on "Delete GIF"

    expect(current_path).to eq(admin_categories_path)
    save_and_open_page
    expect(page).not_to have_link(gif.category.name, href: admin_category_path(gif.category))
  end
end

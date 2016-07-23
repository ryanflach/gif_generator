require 'rails_helper'

RSpec.feature "User can favorite a gif" do
  scenario "logged-in user visits the root path" do
    user = create(:user)
    gif = create(:gif)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    page.find(".#{gif.category.name}-image-1").click

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Added GIF to favorites")
    expect(page).to have_content(gif.category.name)
    expect(page).to have_css(".#{gif.category.name}-image-1")
  end
end

require 'rails_helper'

RSpec.feature "User can unfavorite a gif" do
  scenario "logged-in user with favorited gif visits user page" do
    user = create(:user)
    gif = create(:gif)
    user.favorites << gif
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)

    click_on "Remove"

    expect(page).not_to have_css(".#{gif.category.name}-image-1")
    expect(page).to have_content("GIF removed from favorites")

    visit root_path

    expect(page).to have_css(".#{gif.category.name}-image-1")
  end
end

require 'rails_helper'

RSpec.feature "User can view their favorited gifs by category" do
  xscenario "logged-in user visits their gifs index page" do
    gifs = create_list(:gif, 2)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_gifs_path(user)

    expect(page).to have_css(".#{Gif.first.category.name}-image-1")
    expect(page).to have_css(".#{Gif.last.category.name}-image-1")
  end
end

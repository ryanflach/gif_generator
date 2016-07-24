require 'rails_helper'

RSpec.feature "User can view their favorited gifs by category" do
  scenario "logged-in user visits their gifs index page" do
    categories = create_list(:category, 2)
    Category.first.gifs << Gif.create(image_path: 'www.example.com/1.jpg')
    Category.first.gifs << Gif.create(image_path: 'www.example.com/2.jpg')
    Category.last.gifs << Gif.create(image_path: 'www.example.com/3.jpg')
    user = create(:user)
    user.favorites << Gif.all
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit user_path(user)
    expect(page).to have_css(".#{Category.first.name}-image-1")
    expect(page).to have_css(".#{Category.first.name}-image-2")
    expect(page).to have_css(".#{Category.last.name}-image-1")
  end
end

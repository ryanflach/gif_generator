require 'rails_helper'

RSpec.describe FavoriteGif, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:gif)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:gif_id)}
  it "has a unique combination of user_id and gif_id" do
    user = create(:user)
    gif = create(:gif)
    user.favorites << gif
    expect {user.favorites << gif}.to raise_error(ActiveRecord::RecordInvalid)
  end
end

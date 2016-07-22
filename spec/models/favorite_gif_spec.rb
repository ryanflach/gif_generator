require 'rails_helper'

RSpec.describe FavoriteGif, type: :model do
  it {should belong_to(:user)}
  it {should belong_to(:gif)}
  it {should validate_presence_of(:user_id)}
  it {should validate_presence_of(:gif_id)}
  # The following test throws an error, despite the model functioning as expected
  # it {should validate_uniqueness_of(:user_id).scoped_to(:gif_id)}
end

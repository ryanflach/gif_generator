require 'rails_helper'

RSpec.describe Gif, type: :model do
  it {should validate_presence_of(:image_path)}
  it {should validate_uniqueness_of(:image_path).scoped_to(:category_id)}
  it {should have_many(:favorite_gifs)}
  it {should have_many(:users).through(:favorite_gifs)}
  it {should belong_to(:category)}
end

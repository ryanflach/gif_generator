require 'rails_helper'

RSpec.describe User, type: :model do
  it {should have_many(:favorite_gifs)}
  it {should have_many(:favorites).through(:favorite_gifs).source(:gif)}
  it {should validate_presence_of(:username)}
  it {should validate_presence_of(:password)}
  it {should validate_uniqueness_of(:username)}
end

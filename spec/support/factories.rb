include GifHelper

FactoryGirl.define do
  factory :category do
    name
  end

  factory :gif do
    image_path { image_url(self.category.name) }
    category
  end

  factory :user do
    username
    email
    password 'password'

    factory :admin do
      role 1
    end
  end

  sequence :name do |n|
    "Category #{n}"
  end

  # sequence :image_path do |n|
  #   "http://www.example.com/images/#{n}.jpg"
  # end

  sequence :username do |n|
    "Johnny #{n}"
  end

  sequence :email do |n|
    "johnny#{n}@example.com"
  end
end

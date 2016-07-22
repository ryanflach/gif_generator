FactoryGirl.define do
  factory :category do
    name
  end

  factory :gif do
    image_path
    category
  end

  factory :user do
    username
    email
    password 'password'
    role 0

    factory :admin do
      role 1
    end

    # Throws an error that 'Favorite gifs' is invalid
    # factory :user_with_favorites do
    #   favorites { create_list(:gif, 2) }
    # end
  end

  sequence :name do |n|
    "Category #{n}"
  end

  sequence :image_path do |n|
    "http://www.example.com/images/#{n}.jpg"
  end

  sequence :username do |n|
    "Johnny #{n}"
  end

  sequence :email do |n|
    "johnny#{n}@example.com"
  end
end

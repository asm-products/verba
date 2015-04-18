FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password "12345678"
    password_confirmation { password }
    email { Faker::Internet.email }
  end
end

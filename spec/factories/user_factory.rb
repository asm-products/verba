FactoryGirl.define do
  factory :user do
    username "garrettqmartin"
    password "12345678"
    password_confirmation { password }
    email "garrett@example.com"
  end
end

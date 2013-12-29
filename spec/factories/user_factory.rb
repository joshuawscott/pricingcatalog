FactoryGirl.define do
  factory :user do
    email "example@example.com"
    password "secret1234"
    password_confirmation "secret1234"
  end
end
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    nickname { Faker::Internet.user_name }
    meta { {'location': [Faker::Address.latitude, Faker::Address.longitude]} }
  end
end

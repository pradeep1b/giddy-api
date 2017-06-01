FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Internet.user_name }
    meta { {'location': [Faker::Address.latitude, Faker::Address.longitude]} }
    password { 'secret' }
    password_confirmation { 'secret' }
  end
end

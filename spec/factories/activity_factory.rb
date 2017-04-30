FactoryGirl.define do
  factory :activity do
    name { Faker::Name.first_name }
    description { Faker::Lorem.sentence }
    association :user, factory: [:user]
  end
end

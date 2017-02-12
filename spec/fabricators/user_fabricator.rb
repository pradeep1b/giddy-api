Fabricator(:user) do
  email { sequence(:email) { |i| "#{Faker::Name.first_name}.#{i}@#{Faker::Internet.domain_name}" } }
  name { Faker::Name.name }
  password { Faker::Internet.password }
  status { 'active' }
  confirmed_at { Time.zone.now }
  meta {}
end

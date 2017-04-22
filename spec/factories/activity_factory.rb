FactoryGirl.define do
  factory :activity do
    name { Faker::Name.first_name }
    track_file_name { 'test.gpx' }
    track_content_type { 'text/xml' }
    track_file_size { 5.megabytes }
  end
end

FactoryBot.define do
  factory :image do
    comment    {Faker::Lorem.sentence}
    season_id  { 2 }
    picture{
    Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png')) }
  end
end
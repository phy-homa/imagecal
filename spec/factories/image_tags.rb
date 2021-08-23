FactoryBot.define do
  factory :image_tag do
    comment    {Faker::Lorem.sentence}
    season_id  { 2 }
    name       {Faker::Lorem.word}
    picture{
    Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png')) }
  end
end
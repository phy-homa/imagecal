FactoryBot.define do
  factory :image_tag do
    comment    {Faker::Lorem.sentence}
    season_id  { 2 }
    name       {Faker::Lorem.word}
    picture    {"test.png"}
  end
end

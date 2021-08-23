FactoryBot.define do
  factory :image_calendar do
    association :image
    association :calendar
  end
end
FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    firstname             { "山田" }
    lastname              { "太郎" }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }

    after(:build) do |user|
      user.icon.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

FactoryBot.define do
  factory :order_mailing do
    postal_code   { "123-4567" }
    prefecture_id { 7 }
    city          { "千葉市" }
    address       { "千葉77-88-99" }
    building      { "abcマンション101" }
    tel           { "01234567890" }
    token         { "token123456789" }
  end
end


FactoryBot.define do
  factory :order_address do
    postal_code   { '123-4567' }
    prefecture_id { rand(2..48) }
    city          { 'あああ' }
    block         { 'いいい' }
    building      { '1-1' }
    phone_number  { '01234567890' }
    user_id       { Faker::Number.non_zero_digit }
    item_id       { Faker::Number.non_zero_digit }
    token         { Faker::Internet.password }
  end
end

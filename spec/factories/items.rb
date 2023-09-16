FactoryBot.define do
  factory :item do
    name               { 'test' }
    description        { 'testtesttest' }
    price              { rand(300..9_999_999) }
    category_id        { rand(2..11) }
    condition_id       { rand(2..7) }
    delivery_method_id { rand(2..3) }
    delivery_date_id   { rand(2..4) }
    prefecture_id      { rand(2..48) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end

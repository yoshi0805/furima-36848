FactoryBot.define do

  factory :item do
    item_name              {Faker::Lorem.characters( number: 40) }
    detail                 {Faker::Lorem.characters( number: 1000)}
    category_id            {Faker::Number.between(from: 2, to: 11)}
    status_id              {Faker::Number.between(from: 2, to: 6)}
    shipping_burden_id     {Faker::Number.between(from: 2, to: 3)}
    prefecture_id          {Faker::Number.between(from: 2, to: 48)}
    delivery_day_id        {Faker::Number.between(from: 2, to: 4)}
    price                  {Faker::Number.between(from: 1, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('test/fixtures/files/test_image.jpg'),filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end

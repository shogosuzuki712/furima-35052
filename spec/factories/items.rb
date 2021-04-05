FactoryBot.define do
  factory :item do
    
    title                     { Faker::Artist.name }
    text                      { Faker::JapaneseMedia::DragonBall.character }
    category_id               { 2 }
    state_id                  { 2 }
    fee_burden_id             { 2 }
    prefecture_id             { 2 }
    ship_date_id              { 2 }
    price                     { '555' }
    association :user

    after(:build) do |item|
      item.image.attach(
        io: File.open('public/images/test_image.png'),
        filename: 'test_image.png'
      )
    end
  end
end

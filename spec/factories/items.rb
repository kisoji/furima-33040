FactoryBot.define do
  factory :item do
    name              { '東西' }
    introduction      { '固くて大きいもの' }
    category_id       { '3' }
    condition_id      { '3' }
    delivery_id       { '2' }
    prefecture_id     { '6' }
    preparation_id    { '2' }
    price             { '888' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/sample.jpg'), filename: 'sample.jpg')
    end
  end
end

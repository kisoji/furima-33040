FactoryBot.define do
  factory :user_order do
    post_code { '123-4567' }
    prefecture_id { 13 }
    city { '横須賀子市磯子区' }
    house_number { '張南2-5-8' }
    building_name { '竹花ビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end

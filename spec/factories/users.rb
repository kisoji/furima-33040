FactoryBot.define do
  factory :user do
    nickname              { 'かん' }
    email                 { Faker::Internet.free_email }
    password              { '000000a' }
    password_confirmation { password }
    first_name            { '寒二郎' }
    family_name           { '小出' }
    first_name_kana       { 'カンジロウ' }
    family_name_kana      { 'コイデ' }
    birth_day             { '1952-06-07' }
  end
end

FactoryBot.define do
  factory :user do
    nickname { "abebuu" }
    email { Faker::Internet.email }
    password { "00000000" }
    password_confirmation { "00000000" }
    first_name { "ひろし" }
    last_name { "佐藤" }
    yomi_first_name { "ヒロシ" }
    yomi_last_name { "サトウ" }
    birth_day { Date.new(1996,05,30) }
    phone_number { "00011112222" }
  end
end

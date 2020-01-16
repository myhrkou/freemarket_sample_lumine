FactoryBot.define do
  factory :user do
    nickname { "abebuu" }
    email { Faker::Internet.email }
    password { "00000000" }
    password_confirmation { "00000000" }
    first_name { "hiroshi" }
    last_name { "abe" }
    yomi_first_name { "hiroshi" }
    yomi_last_name { "abe" }
    birth_day { "1996/05/30" }
    phone_number { "00011112222" }
  end
end

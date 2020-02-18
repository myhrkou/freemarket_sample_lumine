FactoryBot.define do
  factory :item do
    name                   {"aaa"}
    description            {"説明"}
    condition              {"未使用に近い"}
    delivery_charge_detail {"着払い（購入者負担）"}
    delivery_origin_id     {"4"}
    delivery_date          {"2~3日で発送"}
    price                  {"9000"}
    user_id                {"4"}
    category_id            {"20"}
  end
end
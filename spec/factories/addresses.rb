FactoryBot.define do
  factory :address do
    zip { "000-1111" }
    prefecture_id {1}
    city {"苫小牧市"}
    number {"1-1-1"}
    building{"building"}
    user_id {"1"}
  end
end

FactoryBot.define do
  factory :address do
    zip { "000-1111" }
    prefecture {"北海道"}
    city {"苫小牧市"}
    number {"1-1-1"}
    building{"building"}
    user_id {"1"}
  end
end

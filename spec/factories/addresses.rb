FactoryBot.define do
  factory :address do
    zip { "0001111" }
    prefecture {"NY"}
    city {"brooklyn"}
    number {"1-1-1"}
    building{"building"}
    user_id {"1"}
  end
end

FactoryBot.define do
  factory :ticket do
    price { 0 }
    campaign
    count { 200 }
  end
end

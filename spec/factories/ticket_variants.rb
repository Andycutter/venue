FactoryBot.define do
  factory :ticket_variant do
    name { "MyString" }
    base_price_percentage { 1.5 }
    ticket { nil }
    sold_count { 0 }
  end
end

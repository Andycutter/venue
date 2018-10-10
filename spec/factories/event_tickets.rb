FactoryBot.define do
  factory :event_ticket do
    user 
    uuid { UUIDTools::UUID.timestamp_create.to_s }
    campaign
  end
end

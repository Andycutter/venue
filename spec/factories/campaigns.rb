FactoryBot.define do
  factory :campaign do
    title { "MyString" }
    description { "MyText" }
    location { "MyString" }
    featured { false }
    user
    after :build do |campaign|
      campaign.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'dummy.jpg')), filename: "image.jpg", content_type: 'image/jpg')
      campaign.performers << create(:performer)
    end
    event_date { '2019-05-05' }
  end
end
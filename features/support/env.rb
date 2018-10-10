require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'
require 'email_spec'
require 'email_spec/cucumber'
ActionController::Base.allow_rescue = false

World(FactoryBot::Syntax::Methods)

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Before do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_mock)
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(OmniAuthFixtures.google_oauth2_response)
  3.times do |index|
    slider = FactoryBot.create(:slider)
    slider.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', "hero-carousel-#{index + 1}.jpg")), filename: "image.jpg", content_type: 'image/jpg')
  end
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Chromedriver.set_version '2.36'

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
      args: %w(disable-popup-blocking disable-infobars window-size=1900,1400 auto-open-devtools-for-tabs)
  )
  # Use auto-open-devtools-for-tabs to open dev tools if you want to use a debugger
  Capybara::Selenium::Driver.new(
      app,
      browser: :chrome,
      options: options
  )
end
Capybara.javascript_driver = :selenium


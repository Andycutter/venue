source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem "haml-rails", "~> 1.0"
gem 'devise'
gem 'omniauth-facebook'
gem 'pundit'
gem 'omniauth-google-oauth2', '~> 0.5.3'
gem 'mui-sass', '~> 0.9.35'
gem 'font-awesome-sass', '~> 5.0', '>= 5.0.13'
gem 'state_machines-activerecord'
gem 'stripe-rails'
gem 'acts_as_shopping_cart', '~> 0.4.1'
gem 'aws-sdk-s3', '~> 1.0.0.rc2'
gem 'high_voltage', '~> 3.1'
gem 'prawn-svg', '~> 0.28.0'  
gem 'prawn-rails'
gem 'rqrcode'
gem 'barby', require: true
gem 'sendgrid-actionmailer', github: 'eddiezane/sendgrid-actionmailer'

group :development, :test do
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
  gem 'coveralls', require: false
  gem 'pundit-matchers', '~> 1.6.0'
  gem 'state_machines-rspec'
  gem 'stripe-ruby-mock', '~> 2.5.4', require: 'stripe_mock'
  gem 'uuidtools'
  gem 'email_spec'
  gem 'pdf-inspector', require: 'pdf/inspector'

end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

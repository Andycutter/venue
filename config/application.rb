require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Venue
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators do |generate|
      generate.helper false
      generate.assets false
      generate.view_specs false
      generate.helper_specs false
      generate.routing_specs false
      generate.controller_specs false
      generate.system_tests false
    end
    if Rails.env.production?
      config.stripe.secret_key = Rails.application.credentials.stripe_production[:secret_key]
      config.stripe.publishable_key = Rails.application.credentials.stripe_production[:publishable_key]
    else
      config.stripe.secret_key = Rails.application.credentials.stripe_development[:secret_key]
      config.stripe.publishable_key = Rails.application.credentials.stripe_development[:publishable_key]
    end

    config.stripe.endpoint = '/payment/stripe-integration'
  end
end

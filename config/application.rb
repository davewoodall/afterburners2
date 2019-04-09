# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Afterburners
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.fixtures false
      g.view_specs false
      g.helper_specs false
      g.controller_specs false
      g.routing_specs false
      g.assets false
      g.helper false
    end

    config.middleware.use Rack::Attack

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: %i[get post options]
      end
    end

    config.load_defaults 5.2
  end
end

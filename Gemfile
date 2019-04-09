# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bulma-rails'
gem 'httparty'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'rack-attack'
gem 'rack-cors'
gem 'rails', '~> 5.2.2'
gem 'rubocop', '~> 0.67.2', require: false
gem 'rubocop-performance'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring-commands-rspec'
  gem 'xray-rails'
end

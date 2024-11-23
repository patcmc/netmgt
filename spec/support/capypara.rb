# frozen_string_literal: true

require "capybara/rails"
require "capybara/rspec"

Capybara.configure do |config|
  config.default_driver = :rack_test
  config.javascript_driver = :selenium_chrome_headless
  config.default_max_wait_time = 10 # seconds
end
# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
require "spec_helper"
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "rspec/rails"

# Add additional requires for libraries here (e.g., FactoryBot, ShouldaMatchers)
require "factory_bot_rails"
require "database_cleaner/active_record"

# Automatically require files in spec/support and its subdirectories
Dir[Rails.root.join("spec/support/**/*.rb")].sort.each { |file| require file }

# Ensure that pending migrations are applied before tests are run
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort(e.to_s.strip)
end

# Configure Shoulda Matchers to use RSpec as the test framework and full matcher libraries for Rails
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework(:rspec)
    with.library(:rails)
  end
end

# Capybara configuration
Capybara.register_driver(:chrome) do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.configure do |config|
  config.javascript_driver = :chrome
  config.default_max_wait_time = 10 # seconds
end

RSpec.configure do |config|
  # Use FactoryBot shortcuts
  config.include(FactoryBot::Syntax::Methods)

  # Include Devise test helpers for controller specs
  config.include(Devise::Test::ControllerHelpers, type: :controller)

  # Include ViewComponent test helpers
  config.include(ViewComponent::TestHelpers, type: :component)
  config.include(ViewComponent::SystemTestHelpers, type: :component)
  config.include(Capybara::RSpecMatchers, type: :component)
  config.include(ViewComponentContext, type: :component)

  # Fixture path configuration
  config.fixture_paths = [
    Rails.root.join("spec/fixtures"),
  ]

  # Use transactional fixtures for tests
  config.use_transactional_fixtures = false

  config.before(:suite) do
    # Configure DatabaseCleaner for non-transactional tests
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Infer spec type from file location
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces
  config.filter_rails_from_backtrace!
  # You can filter arbitrary gems as well
  # config.filter_gems_from_backtrace("gem name")

  # Use documentation format for debugging if ENV variable is set
  config.default_formatter = "doc" if ENV["RSPEC_DOC"] == "true"

  # Enable focus filtering to run only tests with `:focus` metadata
  config.filter_run_when_matching(:focus)
end

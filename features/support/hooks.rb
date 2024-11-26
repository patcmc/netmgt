# frozen_string_literal: true

# Start DatabaseCleaner before each scenario
Before do |_scenario|
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end

# Switch to JavaScript driver for scenarios tagged with @javascript
Before("@javascript") do
  Capybara.current_driver = :selenium_chrome_headless
end

# Revert to default driver after JavaScript scenarios
After("@javascript") do
  Capybara.use_default_driver
end

# Optional: Capture screenshots on failure (requires additional setup)
# After do |scenario|
#   if scenario.failed?
#     timestamp = Time.now.strftime("%Y%m%d-%H%M%S")
#     screenshot_name = "screenshot-#{scenario.name}-#{timestamp}.png"
#     save_screenshot("screenshots/#{screenshot_name}")
#     embed("screenshots/#{screenshot_name}", "image/png", "Screenshot")
#   end
# end

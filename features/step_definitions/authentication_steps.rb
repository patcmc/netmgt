# frozen_string_literal: true

When("the user logs in with email {string} and password {string}") do |email, password|
  login_as(email, password)
end

Then("they should see the dashboard") do
  expect(page).to(have_current_path(app_dashboard_path))
end

Then("they should still be on the login page") do
  expect(page).to(have_current_path(new_user_session_path))
end

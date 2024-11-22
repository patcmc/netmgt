# frozen_string_literal: true

Given("I am on the login page") do
  visit new_user_session_path
end

When("I enter valid credentials") do
  fill_in "Email", with: "valid@example.com"
  fill_in "Password", with: "password"
end

When("I enter invalid credentials") do
  fill_in "Email", with: "invalid@example.com"
  fill_in "Password", with: "wrongpassword"
end

When("I click the login button") do
  click_button "Log in"
end

Then("I should be redirected to the dashboard") do
  expect(page).to(have_current_path(dashboard_path))
end

Then("I should see an error message") do
  expect(page).to(have_content("Invalid Email or password."))
end

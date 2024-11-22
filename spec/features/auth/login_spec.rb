# frozen_string_literal: true

require "rails_helper"

RSpec.feature("User Login", type: :feature) do
  let(:user) { create(:user, email: "user@example.com", password: "password") }

  scenario "User logs in with valid credentials" do
    # Visit the login page
    visit new_user_session_path

    # Fill in the login form
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    # Click the login button
    click_button "Log in"

    # Expectation: User is redirected to the dashboard or homepage
    expect(current_path).to(eq(app_dashboard_path))
  end

  scenario "User fails to log in with invalid credentials" do
    # Visit the login page
    visit new_user_session_path

    # Fill in the login form with invalid credentials
    fill_in "Email", with: "wrong@example.com"
    fill_in "Password", with: "wrongpassword"

    # Click the login button
    click_button "Log in"

     # Expectation: User stays on the login page
    expect(current_path).to(eq(new_user_session_path))
  end
end

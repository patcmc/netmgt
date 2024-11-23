# frozen_string_literal: true

require "rails_helper"

RSpec.feature("User Login", type: :feature) do
  let(:user) { create(:user, email: "user@example.com", password: "password") }

  scenario "User logs in with valid credentials" do
    login_as(user)
    expect(current_path).to(eq(app_dashboard_path))
  end

  scenario "User fails to log in with invalid credentials" do
    visit new_user_session_path
    fill_in_login_form(email: "wrong@example.com", password: "wrongpassword")
    click_button "Log in"

    expect(current_path).to(eq(new_user_session_path))
  end
end

# frozen_string_literal: true

module AuthenticationHelper
  def login_as(user, password: TestConstants::USER_PASSWORD)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_button "Log in"
  end

  def logout
    click_link "Log out"
  end
end
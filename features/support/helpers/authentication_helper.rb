# frozen_string_literal: true

module AuthenticationHelper
  def login_as(email, password)
    visit(new_user_session_path)
    fill_in("Email", with: email)
    fill_in("Password", with: password)
    click_button("Log in")
  end
end

World(AuthenticationHelper)

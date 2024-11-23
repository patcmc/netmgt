# frozen_string_literal: true

module FormHelper
  def fill_in_login_form(email:, password:)
    fill_in "Email", with: email
    fill_in "Password", with: password
  end
end
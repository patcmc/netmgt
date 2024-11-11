# frozen_string_literal: true

module AuthenticationHelper
  def current_user
    Current.user
  end

  def user_signed_in?
    current_user.present?
  end
end

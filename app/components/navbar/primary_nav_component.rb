# frozen_string_literal: true

module Navbar
  class PrimaryNavComponent < ViewComponent::Base
    def initialize(user: Current.user)
      super()
      @user = user
    end

    def user_signed_in?
      @user.present?
    end
  end
end

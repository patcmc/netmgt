# frozen_string_literal: true

module Dropdown
  class UserMenuComponent < ViewComponent::Base
    def initialize(user: Current.user)
      super()
      @user = user
    end

    def user_name
      @user ? @user.email : "Guest"
    end

    def user_email
      @user ? @user.email : ""
    end

    def user_avatar_url
      if @user
        gravatar_id = Digest::MD5.hexdigest(@user.email.downcase)
        "https://www.gravatar.com/avatar/#{gravatar_id}?d=monsterid"
      else
        "https://www.gravatar.com/avatar/00000000000000000000000000000000?d=mp&f=y"
      end
    end
  end
end

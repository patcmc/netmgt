# frozen_string_literal: true

module Modal
  class UserContactComponent < BaseComponent
    def initialize(user_contact:, url:)
      super()
      @user_contact = user_contact
      @url = url
    end
  end
end

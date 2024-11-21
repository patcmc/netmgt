# frozen_string_literal: true

module Card
  class UserContactComponent < BaseComponent
    def initialize(user_contact:)
      super()
      @user_contact = user_contact
    end

    def render?
      @user_contact.present?
    end
  end
end

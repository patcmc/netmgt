# frozen_string_literal: true

module Button
  module Destroy
    class UserContactComponent < BaseComponent
      def initialize(user_contact:)
        super()
        @user_contact = user_contact
      end
    end
  end
end

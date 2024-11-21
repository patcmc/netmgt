# frozen_string_literal: true

module Content
  module App
    class ContactsComponent < BaseComponent
      def initialize(user_contacts:)
        super()
        @user_contacts = user_contacts
      end

      def before_render
        with_breadcrumb(
          [
            { name: "Home", path: "/" },
            { name: "App", path: "/app" },
            { name: "Contacts", path: nil },
          ],
        )
      end
    end
  end
end

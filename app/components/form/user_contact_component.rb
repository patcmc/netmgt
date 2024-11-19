# frozen_string_literal: true

module Form
  class UserContactComponent < BaseComponent
    def initialize(user_contact:, url:)
      super()
      @user_contact = user_contact || UserContact.new
      @url = url
    end

    def cancel_path
      @user_contact.new_record? ? app_contacts_path : app_contact_path(@user_contact)
    end

    def submit_label
      @user_contact.new_record? ? "Create" : "Save"
    end
  end
end

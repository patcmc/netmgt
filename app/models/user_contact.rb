# frozen_string_literal: true

class UserContact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_create_commit do
    broadcast_append_to "user_contacts_#{user_id}",
      target: "user-contacts",
      html: BaseController.renderer.render(Card::UserContactComponent.new(user_contact: self))
  end
  after_update_commit do
    broadcast_replace_to "user_contacts_#{user_id}",
      target: self,
      html: BaseController.renderer.render(Card::UserContactComponent.new(user_contact: self))
  end
  after_destroy_commit do
    broadcast_remove_to "user_contacts_#{user_id}",
      target: self
  end
end

# frozen_string_literal: true

class UserContact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  after_create_commit { broadcast_prepend_to "user_contacts" }
end

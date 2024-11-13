# frozen_string_literal: true

class UserContact < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

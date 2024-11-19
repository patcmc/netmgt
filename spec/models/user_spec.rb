# frozen_string_literal: true

require "rails_helper"

RSpec.describe(User, type: :model) do
  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(email: "john.doe@example.com", password: "password")
      expect(user).to(be_valid)
    end

    it "is not valid without an email" do
      user = User.new(email: nil, password: "password")
      expect(user).not_to(be_valid)
    end

    it "is not valid without a password" do
      user = User.new(email: "john.doe@example.com", password: nil)
      expect(user).not_to(be_valid)
    end

    it "is not valid with an invalid email" do
      user = User.new(email: "invalid_email", password: "password")
      expect(user).not_to(be_valid)
    end
  end

  describe "associations" do
    it "has many user_contacts with dependent destroy" do
      association = described_class.reflect_on_association(:user_contacts)
      expect(association.options[:dependent]).to(eq(:destroy))
    end
  end
end

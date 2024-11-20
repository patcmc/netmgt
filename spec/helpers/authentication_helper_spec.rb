# frozen_string_literal: true

require "rails_helper"

RSpec.describe(AuthenticationHelper, type: :helper) do
  let(:user) { create(:user) }

  before do
    Current.user = user
  end

  after do
    Current.user = nil
  end

  describe "#current_user" do
    it "returns the current user" do
      expect(helper.current_user).to(eq(user))
    end
  end

  describe "#user_signed_in?" do
    context "when user is signed in" do
      it "returns true" do
        expect(helper.user_signed_in?).to(be(true))
      end
    end

    context "when no user is signed in" do
      before do
        Current.user = nil
      end

      it "returns false" do
        expect(helper.user_signed_in?).to(be(false))
      end
    end
  end
end

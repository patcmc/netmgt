# frozen_string_literal: true

require "rails_helper"

RSpec.describe(AuthenticationHelper, type: :helper) do
  fixtures :users

  let(:user) { users(:john_doe) }

  around do |example|
    Current.user = user
    example.run
    Current.user = nil
  end

  describe "#current_user" do
    subject { helper.current_user }
    it { is_expected.to(eq(user)) }
  end

  describe "#user_signed_in?" do
    subject { helper.user_signed_in? }

    context "when user is signed in" do
      it { is_expected.to(be(true)) }
    end

    context "when no user is signed in" do
      before { Current.user = nil }
      it { is_expected.to(be(false)) }
    end
  end
end

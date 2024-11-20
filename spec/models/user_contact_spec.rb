# frozen_string_literal: true

require "rails_helper"

RSpec.describe(UserContact, type: :model) do
  let(:user) { create(:user) }
  let(:user_contact) { build(:user_contact, user: user) }

  describe "associations" do
    it { is_expected.to(belong_to(:user)) }
  end

  describe "validations" do
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_presence_of(:email)) }
    it { is_expected.to(allow_value("test@example.com").for(:email)) }
    it { is_expected.not_to(allow_value("invalid").for(:email)) }
  end

  describe "callbacks" do
    let(:user) { create(:user) }
    let(:user_contact) { build(:user_contact, user: user) }

    before do
      allow(BaseController.renderer).to(receive(:render).and_return("<div>Rendered HTML</div>"))
    end

    context "after_create_commit" do
      it "broadcasts append to the correct stream with rendered HTML" do
        expect do
          user_contact.save!
        end.to(have_broadcasted_to("user_contacts_#{user.id}").with) do |data|
          data[:target] == "user-contacts" &&
            data[:html] == "<div>Rendered HTML</div>"
        end
      end
    end

    context "after_update_commit" do
      it "broadcasts replace to the correct stream with rendered HTML" do
        user_contact.save!
        expect do
          user_contact.update!(name: "New Name")
        end.to(have_broadcasted_to("user_contacts_#{user.id}").with) do |data|
          data[:target] == user_contact &&
            data[:html] == "<div>Rendered HTML</div>"
        end
      end
    end

    context "after_destroy_commit" do
      it "broadcasts remove to the correct stream" do
        user_contact.save!
        expect do
          user_contact.destroy
        end.to(have_broadcasted_to("user_contacts_#{user.id}").with) do |data|
          data[:target] == user_contact
        end
      end
    end
  end
end

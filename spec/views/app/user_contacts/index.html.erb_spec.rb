# frozen_string_literal: true

require "rails_helper"

RSpec.describe("app/user_contacts/index.html.erb", type: :view) do
  let(:page) { Capybara.string(rendered) }
  let(:user) { create(:user) }
  let(:user_contacts) do
    [
      create(:user_contact, user: user, name: "John Doe", email: "john@example.com"),
      create(:user_contact, user: user, name: "Jane Smith", email: "jane@example.com"),
    ]
  end

  before do
    allow(view).to(receive(:current_user).and_return(user))
    assign(:user_contacts, user_contacts)
    render
  end

  it "displays all user contacts" do
    user_contacts.each do |contact|
      expect(page).to(have_content(contact.name))
      expect(page).to(have_content(contact.email))
    end
  end

  # it "displays each user contact with correct structure" do
  #   user_contacts.each do |contact|
  #     expect(page).to(have_selector(".contact-card", text: contact.name))
  #     expect(page).to(have_selector(".contact-card .email", text: contact.email))
  #   end
  # end

  it "displays the new contact button component" do
    expect(page).to(have_selector("button", text: "Add Contact"))
  end

  it "displays the breadcrumb component" do
    expect(page).to(have_content("Home"))
    expect(page).to(have_content("App"))
    expect(page).to(have_content("Contacts"))
  end

  context "when there are no contacts" do
    let(:user_contacts) { [] }

    it "displays a no contacts message" do
      expect(page).to(have_content("No contacts available."))
    end
  end
end

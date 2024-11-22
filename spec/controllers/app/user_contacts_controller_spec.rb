# frozen_string_literal: true

require "rails_helper"

RSpec.describe(App::UserContactsController, type: :controller) do
  let(:user) { create(:user) }
  let(:user_contact) { create(:user_contact, user: user) }

  before { sign_in(user) }

  describe "routing" do
    it { is_expected.to(route(:get, "/app/contacts").to(action: :index)) }
    it { is_expected.to(route(:get, "/app/contacts/new").to(action: :new)) }
    it { is_expected.to(route(:post, "/app/contacts").to(action: :create)) }
    it { is_expected.to(route(:get, "/app/contacts/1").to(action: :show, id: 1)) }
    it { is_expected.to(route(:get, "/app/contacts/1/edit").to(action: :edit, id: 1)) }
    it { is_expected.to(route(:put, "/app/contacts/1").to(action: :update, id: 1)) }
    it { is_expected.to(route(:patch, "/app/contacts/1").to(action: :update, id: 1)) }
    it { is_expected.to(route(:delete, "/app/contacts/1").to(action: :destroy, id: 1)) }
  end

  shared_examples "a successful GET request" do
    it "responds with HTTP success" do
      get action, params: params, as: :html
      expect(response).to(have_http_status(:success))
    end
  end

  describe "GET #index" do
    let(:action) { :index }
    let(:params) { {} }

    it_behaves_like "a successful GET request"
  end

  describe "GET #show" do
    let(:action) { :show }
    let(:params) { { id: user_contact.id } }

    it_behaves_like "a successful GET request"
  end

  describe "GET #new" do
    let(:action) { :new }
    let(:params) { {} }

    it_behaves_like "a successful GET request"
  end

  describe "GET #edit" do
    let(:action) { :edit }
    let(:params) { { id: user_contact.id } }

    it_behaves_like "a successful GET request"
  end

  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:user_contact) }
    let(:invalid_attributes) { attributes_for(:user_contact, :invalid) }

    context "with valid params" do
      it "creates a new UserContact and redirects" do
        expect { post(:create, params: { user_contact: valid_attributes }) }
          .to(change(UserContact, :count).by(1))
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was successfully created."))
      end

      it "broadcasts a Turbo Streams message" do
        expect do
          post(:create, params: { user_contact: valid_attributes })
        end.to(have_broadcasted_to("user_contacts_#{user.id}").with) do |data|
          data[:target] == user_contact
        end
      end

      it "renders a successful response with Turbo Streams" do
        post :create, params: { user_contact: valid_attributes }, as: :turbo_stream
        expect(response).to(have_http_status(:success))
      end
    end

    context "with invalid params" do
      it "does not create a new UserContact and redirects" do
        expect { post(:create, params: { user_contact: invalid_attributes }) }
          .not_to(change(UserContact, :count))
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was not created."))
      end

      it "does not broadcast a Turbo Streams message" do
        expect do
          post(:create, params: { user_contact: invalid_attributes })
        end.not_to(have_broadcasted_to("user_contacts_#{user.id}"))
      end

      it "renders a failure response with Turbo Streams" do
        post :create, params: { user_contact: invalid_attributes }, as: :turbo_stream
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end

  describe "PUT/PATCH #update" do
    let(:new_attributes) { attributes_for(:user_contact) }
    let(:invalid_attributes) { attributes_for(:user_contact, :invalid) }

    before { user_contact }

    context "with valid params" do
      it "updates the user_contact and redirects" do
        put :update, params: { id: user_contact.to_param, user_contact: new_attributes }
        user_contact.reload
        expect(user_contact).to(have_attributes(new_attributes.except(:tags))) # tags are not updated
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was successfully updated."))
      end

      it "broadcasts a Turbo Streams message" do
        expect do
          put(:update, params: { id: user_contact.to_param, user_contact: new_attributes })
        end.to(have_broadcasted_to("user_contacts_#{user.id}").with) do |data|
          data[:target] == user_contact
        end
      end

      it "renders a successful response with Turbo Streams" do
        put :update, params: { id: user_contact.to_param, user_contact: new_attributes }, as: :turbo_stream
        expect(response).to(have_http_status(:success))
      end
    end

    context "with invalid params" do
      it "does not update the user_contact and redirects" do
        original_attributes = user_contact.attributes
        put :update, params: { id: user_contact.to_param, user_contact: invalid_attributes }
        user_contact.reload
        expect(user_contact.attributes).to(eq(original_attributes))
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was not updated."))
      end

      it "does not broadcast a Turbo Streams message" do
        expect do
          put(:update, params: { id: user_contact.to_param, user_contact: invalid_attributes })
        end.not_to(have_broadcasted_to("user_contacts_#{user.id}"))
      end

      it "renders a failure response with Turbo Streams" do
        put :update, params: { id: user_contact.to_param, user_contact: invalid_attributes }, as: :turbo_stream
        expect(response).to(have_http_status(:unprocessable_entity))
      end
    end
  end

  describe "DELETE #destroy" do
    before { user_contact }

    it "destroys the user_contact and redirects" do
      expect { delete(:destroy, params: { id: user_contact }) }
        .to(change(UserContact, :count).by(-1))
      expect(response).to(redirect_to(app_contacts_path))
    end

    it "broadcasts a Turbo Streams message" do
      expect do
        delete(:destroy, params: { id: user_contact })
      end.to(have_broadcasted_to("user_contacts_#{user.id}").with) do |data|
        data[:target] == user_contact
      end
    end

    it "renders a successful response with Turbo Streams" do
      delete :destroy, params: { id: user_contact }, as: :turbo_stream
      expect(response).to(have_http_status(:success))
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe(App::UserContactsController, type: :controller) do
  # Utilize FactoryBot to create necessary test data
  let(:user) { create(:user) }
  let(:user_contact) { create(:user_contact, user: user) }

  # Authenticate the user before each test
  before do
    sign_in(user)
  end

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

  # Shared examples for actions that should respond successfully
  shared_examples "a successful GET request" do
    it "responds with HTTP success" do
      get action, params: params
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
    let(:params) { { id: user_contact } }

    it_behaves_like "a successful GET request"
  end

  describe "GET #new" do
    let(:action) { :new }
    let(:params) { {} }

    it_behaves_like "a successful GET request"
  end

  describe "GET #edit" do
    let(:action) { :edit }
    let(:params) { { id: user_contact } }

    it_behaves_like "a successful GET request"
  end

  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:user_contact) }
    let(:invalid_attributes) { attributes_for(:user_contact, :invalid) }

    context "with valid params" do
      it "creates a new UserContact" do
        expect do
          post(:create, params: { user_contact: valid_attributes })
        end.to(change(UserContact, :count).by(1))
      end

      it "redirects to the created user_contact" do
        post :create, params: { user_contact: valid_attributes }
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was successfully created."))
      end
    end

    context "with invalid params" do
      it "does not create a new UserContact" do
        expect do
          post(:create, params: { user_contact: invalid_attributes })
        end.not_to(change(UserContact, :count))
      end

      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { user_contact: invalid_attributes }
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was not created."))
      end
    end
  end

  describe "PUT/PATCH #update" do
    let(:new_attributes) { attributes_for(:user_contact) }
    let(:invalid_attributes) { attributes_for(:user_contact, :invalid) }

    context "with valid params" do
      it "updates the requested user_contact" do
        put :update, params: { id: user_contact.to_param, user_contact: new_attributes }
        user_contact.reload
        expect(user_contact.name).to(eq(new_attributes[:name]))
        expect(user_contact.email).to(eq(new_attributes[:email]))
        expect(user_contact.phone).to(eq(new_attributes[:phone]))
        expect(user_contact.address).to(eq(new_attributes[:address]))
      end

      it "redirects to the user_contact" do
        put :update, params: { id: user_contact.to_param, user_contact: new_attributes }
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was successfully updated."))
      end
    end

    context "with invalid params" do
      it "does not update the user_contact" do
        original_attributes = user_contact.attributes
        put :update, params: { id: user_contact, user_contact: invalid_attributes }
        user_contact.reload
        expect(user_contact.attributes).to(eq(original_attributes))
      end

      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: user_contact.to_param, user_contact: invalid_attributes }
        expect(response).to(redirect_to(app_contacts_path))
        expect(flash[:notice]).to(eq("User contact was not updated."))
      end
    end
  end

  describe "DELETE #destroy" do
    before { user_contact }

    it "destroys the requested user_contact" do
      expect do
        delete(:destroy, params: { id: user_contact })
      end.to(change(UserContact, :count).by(-1))
    end

    it "redirects to the contacts list" do
      delete :destroy, params: { id: user_contact }
      expect(response).to(redirect_to(app_contacts_path))
    end
  end
end

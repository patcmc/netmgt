# frozen_string_literal: true

module App
  class UserContactsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user_contact, only: [:show, :edit, :update, :destroy]

    def index
      @user_contacts = current_user.user_contacts
      @user_contact = UserContact.new(user: current_user)
    end

    def show; end

    def new
      @user_contact = current_user.user_contacts.build
    end

    def create
      @user_contact = current_user.user_contacts.build(user_contact_params)

      if @user_contact.save
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to(app_contacts_path, notice: "User contact was successfully created.") }
        end
      else
        respond_to do |format|
          format.turbo_stream { head(:unprocessable_entity) }
          format.html { redirect_to(app_contacts_path, notice: "User contact was not created.") }
        end
      end
    end

    def edit; end

    def update
      if @user_contact.update(user_contact_params)
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to(app_contacts_path, notice: "User contact was successfully updated.") }
        end
      else
        respond_to do |format|
          format.turbo_stream { head(:unprocessable_entity) }
          format.html { redirect_to(app_contacts_path, notice: "User contact was not updated.") }
        end
      end
    end

    def destroy
      @user_contact.destroy

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to(app_contacts_path, notice: "User contact was successfully destroyed") }
      end
    end

    private

    def set_user_contact
      @user_contact = current_user.user_contacts.find(params[:id])
    end

    def user_contact_params
      params.require(:user_contact).permit(:name, :email, :phone, :address, :tags)
    end
  end
end

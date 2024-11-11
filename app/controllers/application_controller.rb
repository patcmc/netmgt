# frozen_string_literal: true

class ApplicationController < ActionController::Base
  layout :layout_by_resource

  before_action :set_current_user

  private

  def layout_by_resource
    if user_signed_in?
      "authenticated"
    else
      "unauthenticated"
    end
  end

  # Sets the current authenticated user for the global per-request attributes lifecycle.
  # This allows easy access to the current user throughout the application
  # via the Current.user attribute, making it available in controllers,
  # models, and views without needing to pass it explicitly.
  def set_current_user
    Current.user = current_user
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end

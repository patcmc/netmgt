# frozen_string_literal: true

class BaseController < ActionController::Base
  before_action :set_current_user

  private

  # Sets the current authenticated user for the global per-request attributes lifecycle.
  # This allows easy access to the current user throughout the application
  # via the Current.user attribute, making it available in controllers,
  # models, and views without needing to pass it explicitly.
  def set_current_user
    Current.user = current_user
  end

  def after_sign_in_path_for(resource)
    app_dashboard_path
  end
end

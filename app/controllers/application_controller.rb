# frozen_string_literal: true

class ApplicationController < BaseController
  layout :layout_by_resource

  private

  def layout_by_resource
    if user_signed_in?
      "authenticated"
    else
      "unauthenticated"
    end
  end
end

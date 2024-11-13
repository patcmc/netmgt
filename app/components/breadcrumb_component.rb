# frozen_string_literal: true

class BreadcrumbComponent < ViewComponent::Base
  def initialize(links:)
    @links = links
  end
end

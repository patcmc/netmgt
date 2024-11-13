# frozen_string_literal: true

class BreadcrumbComponent < BaseComponent
  def initialize(links:)
    super()
    @links = links
  end
end

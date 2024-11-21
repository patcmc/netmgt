# frozen_string_literal: true

class BreadcrumbComponent < BaseComponent
  attr_reader :links

  def initialize(links: [])
    super()

    @links = links
  end
end

# frozen_string_literal: true

module Content
  module App
    class BaseComponent < ::BaseComponent
      renders_one :breadcrumb, ->(links = []) do
        BreadcrumbComponent.new(links: links)
      end
    end
  end
end

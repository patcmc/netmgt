# frozen_string_literal: true

module Layout
  class BaseComponent < ::BaseComponent
    renders_one :header, ->(classes: "") do
      content_tag(:header, class: classes) do
        render(HeaderComponent.new)
      end
    end
    renders_one :body, -> do
      content_tag(:main) do
        content
      end
    end
    renders_one :footer, ->(classes: "") do
      content_tag(:footer, class: classes) do
        render(FooterComponent.new)
      end
    end
  end
end

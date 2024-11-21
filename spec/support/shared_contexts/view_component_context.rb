# frozen_string_literal: true

require "active_support/concern"

module ViewComponentContext
  extend ActiveSupport::Concern

  included do
    RSpec.shared_context "ViewComponent" do
      subject do
        render_inline(component, &content)
        page
      end

      let(:component) do
        described_class.new(
          *(defined?(args) ? args : []),
          **(defined?(kwargs) ? kwargs : {})
        )
      end

      let(:content) { ->(_view_context = nil) {} }

      let(:component_instance) do
        rendered_content = content.call
        rendered_content ? component.with_content(rendered_content) : component
      end
    end

    include_context "ViewComponent"
  end
end

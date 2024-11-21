# frozen_string_literal: true

module Layout
  class LandingComponent < BaseComponent
    def before_render
      with_header(classes: "sticky top-0")
      with_body
      with_footer(classes: "bg-gray-800 text-white p-4 text-center")
    end
  end
end

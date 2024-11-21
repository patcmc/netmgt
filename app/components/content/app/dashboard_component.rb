# frozen_string_literal: true

module Content
  module App
    class DashboardComponent < BaseComponent
      def before_render
        with_breadcrumb(
          [
            { name: "Home", path: "/" },
            { name: "App", path: "/app" },
            { name: "Dashboard", path: nil },
          ],
        )
      end
    end
  end
end

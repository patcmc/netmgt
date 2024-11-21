# frozen_string_literal: true

class BaseComponent < ViewComponent::Base
  # Turbo helpers
  include Turbo::FramesHelper
  include Turbo::StreamsHelper
  include Turbo::Streams::StreamName
  include Turbo::Streams::Broadcasts

  # Authentication helper
  include AuthenticationHelper
end

# frozen_string_literal: true

class BaseComponent < ViewComponent::Base
  include Turbo::FramesHelper, Turbo::Streams::StreamName, Turbo::Streams::Broadcasts
  include AuthenticationHelper
end

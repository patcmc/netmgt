# frozen_string_literal: true

require_relative "helpers/authentication_helper"
require_relative "helpers/form_helper"

RSpec.configure do |config|
  config.include AuthenticationHelper, type: :feature
  config.include FormHelper, type: :feature
end
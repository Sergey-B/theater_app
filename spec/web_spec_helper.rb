require_relative "db_spec_helper"

require "rack/test"

Dir[SPEC_ROOT.join("support/web/*.rb").to_s].each(&method(:require))
Dir[SPEC_ROOT.join("shared/web/*.rb").to_s].each(&method(:require))

require SPEC_ROOT.join("../system/boot").realpath

require "spec_helper"

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :request
  config.include Test::JsonApiHelpers, type: :request
  config.include Test::WebHelpers

  config.before :suite do
    Test::WebHelpers.app.freeze
  end
end

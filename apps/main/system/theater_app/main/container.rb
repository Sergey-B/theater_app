require "pathname"
require "dry/web/container"
require "dry/system/components"

module TheaterApp
  module Main
    class Container < Dry::Web::Container
      require root.join("system/theater_app/container")
      import core: TheaterApp::Container

      configure do |config|
        config.root = Pathname(__FILE__).join("../../..").realpath.dirname.freeze
        config.logger = TheaterApp::Container[:logger]
        config.default_namespace = "theater_app.main"
        config.auto_register = %w[lib/theater_app/main]
      end

      load_paths! "lib"
    end
  end
end

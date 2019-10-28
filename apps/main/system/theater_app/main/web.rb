require "dry/web/roda/application"
require_relative "container"

module TheaterApp
  module Main
    class Web < Dry::Web::Roda::Application
      configure do |config|
        config.container = Container
        config.routes = "web/routes".freeze
      end

      opts[:root] = Pathname(__FILE__).join("../../..").realpath.dirname

      #use Rack::Session::Cookie, key: "theater_app.main.session", secret: self["core.settings"].session_secret
      use Rack::MethodOverride

      #plugin :csrf, raise: true
      #plugin :dry_view
      plugin :error_handler
      plugin :multi_route
      plugin :all_verbs

      plugin :json_parser
      plugin :halt
      plugin :json,
        classes: [Array, Hash],
        serializer: -> o {
          o.to_json
        }


        route do |r|
          r.root do
            # This route is used for health checks.
            {}
          end

          r.multi_route
        end


        ## Request-specific options for dry-view context object
        #def view_context_options
        #  {
        #    flash:        flash#,
        #    #csrf_token:   Rack::Csrf.token(request.env),
        #    #csrf_metatag: Rack::Csrf.metatag(request.env),
        #    #csrf_tag:     Rack::Csrf.tag(request.env),
        #  }
        #end

        load_routes!
    end
  end
end

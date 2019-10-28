require "theater_app/main/validation/schema"

module TheaterApp
  module Main
    module Validation
      module TheaterPerformances
        Delete = TheaterApp::Main::Validation.Schema do
          required(:id).filled :int?
        end
      end
    end
  end
end

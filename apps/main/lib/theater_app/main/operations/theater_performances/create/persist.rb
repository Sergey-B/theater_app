# frozen_string_literal: true

require 'theater_app/operation'

module TheaterApp
  module Main
    module Operations
      module TheaterPerformances
        module Create
          class Persist < TheaterApp::Operation
            include Import['repositories.theater_performances_repo']

            def call(attrs)
              theater_performances_repo.create(attrs)

              Success(attrs)
            end
          end
        end
      end
    end
  end
end

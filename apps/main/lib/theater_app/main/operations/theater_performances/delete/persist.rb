# frozen_string_literal: true

require 'theater_app/operation'

module TheaterApp
  module Main
    module Operations
      module TheaterPerformances
        module Delete
          class Persist < TheaterApp::Operation
            include Import['repositories.theater_performances_repo']

            def call(attrs)
              theater_performances_repo.delete(attrs[:id])

              Success(attrs)
            end
          end
        end
      end
    end
  end
end

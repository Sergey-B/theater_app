# frozen_string_literal: true

require 'theater_app/operation'

module TheaterApp
  module Main
    module Operations
      module TheaterPerformances
        module Delete
          class FindPerformance < TheaterApp::Operation
            include Import['repositories.theater_performances_repo']

            def call(attrs)
              unless theater_performances_repo.by_id(attrs[:id])
                return Failure :not_found
              end

              Success attrs
            end
          end
        end
      end
    end
  end
end

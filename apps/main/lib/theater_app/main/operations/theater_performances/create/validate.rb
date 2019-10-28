# frozen_string_literal: true

require 'theater_app/operation'
require 'theater_app/main/validation/theater_performances/create'

module TheaterApp
  module Main
    module Operations
      module TheaterPerformances
        module Create
          class Validate < TheaterApp::Operation
            def call(*args)
              validation = Validation::TheaterPerformances::Create.call(*args)

              if validation.success?
                Success(validation.output)
              else
                Failure(validation)
              end
            end
          end
        end
      end
    end
  end
end

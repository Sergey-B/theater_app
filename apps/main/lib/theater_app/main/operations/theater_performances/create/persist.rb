# frozen_string_literal: true

require "theater_app/main/import"
require 'theater_app/operation'

module TheaterApp
  module Main
    module Operations
      module TheaterPerformances
        module Create
          class Persist < TheaterApp::Operation
            include Main::Import['core.persistence.rom']

            def call(attrs)
              rom.relations[:theater_performances].insert(to_performance_attrs attrs)

              Success(attrs)
            end

            private

            def to_performance_attrs args
              args[:duration] = (args.delete(:start_date)..args.delete(:end_date))
              args
            end
          end
        end
      end
    end
  end
end

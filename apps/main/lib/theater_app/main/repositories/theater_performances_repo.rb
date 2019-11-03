# frozen_string_literal: true

require 'theater_app/repository'
require 'theater_app/main/entities/theater_performance'

module TheaterApp
  module Main
    module Repositories
      class TheaterPerformancesRepo < TheaterApp::Repository[:theater_performances]
        commands :create, delete: :by_id

        def by_id(id)
          theater_performances.by_id(id).map_to(Entities::TheaterPerformance).one
        end

        def listing
          theater_performances.map_to(Entities::TheaterPerformance).to_a
        end

        def exist_by_dates_from_and_to?(from, to)
          theater_performances.by_dates(from, to).exist?
        end
      end
    end
  end
end

# frozen_string_literal: true

require "theater_app/main/import"
require 'theater_app/operation'

module TheaterApp
  module Main
    module Operations
      module TheaterPerformances
        module Create
          class CheckDatesAvailability < TheaterApp::Operation
            include Main::Import['repositories.theater_performances_repo']

            def call(attrs)
              dates_already_booked = theater_performances_repo.exist_by_dates_from_and_to?(
                attrs[:start_date],
                attrs[:end_date]
              )
              return Failure :dates_not_available if dates_already_booked

              Success attrs
            end
          end
        end
      end
    end
  end
end

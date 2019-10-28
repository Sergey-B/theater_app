# frozen_string_literal: true

require 'theater_app/operation'

module TheaterApp
  module Main
    module Operations
      module TheaterPerformances
        module Create
          class CalculateSchedule < TheaterApp::Operation
            include Import[
              'repositories.holidays_repo',
              'repositories.theater_performances_repo'
            ]

            def call(attrs)
              schedule = [*attrs[:start_date]..attrs[:end_date]]
                .reject { |date| [0, 6].include?(date.wday) || holidays_repo.by_date(date) }
                .map { |date| { id: attrs[:id], name: attrs[:name], date: date } }

              Success attrs.merge(schedule: schedule.to_json)
            end
          end
        end
      end
    end
  end
end

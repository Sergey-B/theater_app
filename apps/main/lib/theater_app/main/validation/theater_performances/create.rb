require "theater_app/main/validation/schema"

module TheaterApp
  module Main
    module Validation
      module TheaterPerformances
        Create = TheaterApp::Main::Validation.Schema do
          required(:id).filled :int?
          required(:name).filled :str?
          required(:start_date).filled :date?
          required(:end_date).filled :date?

          rule start_date_before_end_date: [:start_date, :end_date] do |start_date, end_date|
            end_date.gt?(value(:start_date))
          end
        end
      end
    end
  end
end

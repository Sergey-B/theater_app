require "types"

module TheaterApp
  module Main
    module Entities
      class TheaterPerformance < Dry::Struct
        attribute :id, Types::Strict::Int
        attribute :name, Types::Strict::String.optional
        attribute :duration, Types::Any

        def start_date
          duration.upper
        end

        def end_date
          duration.lower
        end

        def to_json *args
          JSON.generate \
            id: id,
            name: name,
            start_date: start_date,
            end_date: end_date
        end
      end
    end
  end
end

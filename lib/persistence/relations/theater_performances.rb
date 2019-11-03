# frozen_string_literal: true

module Persistence
  module Relations
    class TheaterPerformances < ROM::Relation[:sql]
      schema(:theater_performances, infer: true)

      def by_id(id)
        qualified.where(id: id)
      end

      def by_dates(date_from, date_to)
        daterange = (date_from..date_to)

        qualified.where {
          Sequel.pg_range(:duration).overlaps daterange
        }
      end
    end
  end
end

# frozen_string_literal: true

module Persistence
  module Relations
    class TheaterPerformances < ROM::Relation[:sql]
      schema(:theater_performances, infer: true)

      def by_id id
        qualified.where(id: id)
      end

      def by_dates date_from, date_to
        qualified.where {
          Sequel.|(
            ( (start_date.qualified <= date_from.to_date) & (end_date.qualified >= date_from.to_date) ),
            ( (start_date.qualified <= date_to.to_date) & (end_date.qualified >= date_to.to_date) ),
            ( (start_date.qualified >= date_from.to_date) & (start_date.qualified <= date_to.to_date) ),
            ( (end_date.qualified >= date_from.to_date) & (end_date.qualified <= date_to.to_date) )
          )
        }
      end
    end
  end
end

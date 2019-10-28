# frozen_string_literal: true

require 'theater_app/repository'

module TheaterApp
  module Repositories
    class TheaterPerformancesRepo < TheaterApp::Repository[:theater_performances]
      commands :create, delete: :by_id

      def by_id(id)
        theater_performances.by_id(id).one
      end

      def listing
        theater_performances.select(:schedule).pluck(:schedule).flatten
      end

      def exist_by_dates_from_and_to?(from, to)
        theater_performances.by_dates(from, to).exist?
      end
    end
  end
end

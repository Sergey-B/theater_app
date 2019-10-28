# frozen_string_literal: true

require 'theater_app/main/transaction'

module TheaterApp
  module Main
    module Transactions
      class DeleteTheaterPerformance < Transaction
        step :validate, with: 'operations.theater_performances.delete.validate'
        step :find_performance, with: 'operations.theater_performances.delete.find_performance'
        step :persist, with: 'operations.theater_performances.delete.persist'
      end
    end
  end
end

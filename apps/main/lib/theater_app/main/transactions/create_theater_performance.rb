# frozen_string_literal: true

require 'theater_app/main/transaction'

module TheaterApp
  module Main
    module Transactions
      class CreateTheaterPerformance < Transaction
        step :validate, with: 'operations.theater_performances.create.validate'
        step :check_dates_availabilty, with: 'operations.theater_performances.create.check_dates_availability'
        step :persist, with: 'operations.theater_performances.create.persist'
      end
    end
  end
end

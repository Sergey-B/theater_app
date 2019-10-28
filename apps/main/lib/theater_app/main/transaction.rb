# frozen_string_literal: true

# auto_register: false

require 'dry/transaction'

module TheaterApp
  module Main
    class Transaction
      include Dry::Transaction(container: Container)
    end
  end
end

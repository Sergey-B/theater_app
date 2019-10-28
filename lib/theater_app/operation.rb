# frozen_string_literal: true

# auto_register: false

require 'dry/transaction/operation'

module TheaterApp
  class Operation
    def self.inherited(subclass)
      subclass.include Dry::Transaction::Operation
    end
  end
end

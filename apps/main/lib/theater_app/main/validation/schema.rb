# frozen_string_literal: true

require 'dry-validation'

module TheaterApp
  module Main
    module Validation
      class Schema < Dry::Validation::Schema::Form
      end

      def self.Schema(&block)
        Dry::Validation.Schema Schema, &block
      end
    end
  end
end

# frozen_string_literal: true

# auto_register: false

require 'slim'
require 'dry/view'
require 'theater_app/main/container'

module TheaterApp
  module Main
    class View < Dry::View
      configure do |config|
        config.paths = [Container.root.join('web/templates')]
        config.default_context = Container['view_context']
        config.layout = 'application'
      end
    end
  end
end

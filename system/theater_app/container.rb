# frozen_string_literal: true

require 'active_support/core_ext/hash'
require 'active_support/core_ext/time'

require 'dry/web/container'
require 'dry/system/components'
require 'dry-monitor'

Dry::Monitor.load_extensions(:rack)

module TheaterApp
  class Container < Dry::Web::Container
    configure do
      config.name = :theater_app
      config.listeners = true
      config.default_namespace = 'theater_app'
      config.auto_register = %w[lib/theater_app]
    end

    load_paths! 'lib'
  end
end

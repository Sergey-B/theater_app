# frozen_string_literal: true

TheaterApp::Container.boot :monitor do
  init do
    require 'dry/monitor'
    # Dry::Monitor.load_extensions(:sql)
  end

  start do
    # Dry::Monitor::SQL::Logger.new(logger).subscribe(notifications)
  end
end

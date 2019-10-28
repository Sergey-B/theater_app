# frozen_string_literal: true

require 'theater_app/main/view'

module TheaterApp
  module Main
    module Views
      class Welcome < View
        configure do |config|
          config.template = 'welcome'
        end
      end
    end
  end
end

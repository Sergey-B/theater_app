# frozen_string_literal: true

require_relative 'theater_app/main/container'

TheaterApp::Main::Container.finalize!

require 'theater_app/main/web'

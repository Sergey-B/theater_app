# frozen_string_literal: true

require 'bundler/setup'

begin
  require 'pry-byebug'
rescue LoadError
end

require_relative 'theater_app/container'

TheaterApp::Container.finalize!

# Load sub-apps
app_paths = Pathname(__FILE__).dirname.join('../apps').realpath.join('*')
Dir[app_paths].each do |f|
  require "#{f}/system/boot"
end

require 'theater_app/web'

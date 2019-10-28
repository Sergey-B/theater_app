# frozen_string_literal: true

# auto_register: false

require 'rom-repository'
require 'theater_app/container'
require 'theater_app/import'

module TheaterApp
  class Repository < ROM::Repository::Root
    include Import.args['persistence.rom']
  end
end

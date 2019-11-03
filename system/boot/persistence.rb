# frozen_string_literal: true

TheaterApp::Container.boot :persistence, namespace: true do |system|
  init do
    require 'sequel'
    require 'rom'
    require 'rom/sql'

    use :monitor, :settings

    ROM::SQL.load_extensions :postgres

    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local
    Sequel.extension(:core_extensions, :pg_range, :pg_range_ops)

    rom_config = ROM::Configuration.new(
      :sql,
      system[:settings].database_url,
      extensions: %i[error_sql pg_array pg_json pg_range]
    )

    rom_config.plugin :sql, relations: :instrumentation do |plugin_config|
      plugin_config.notifications = notifications
    end

    rom_config.plugin :sql, relations: :auto_restrictions

    register 'config', rom_config
    register 'db', rom_config.gateways[:default].connection
  end

  start do
    config = container['persistence.config']
    config.auto_registration system.root.join('lib/persistence')

    db = container['persistence.db']
    db.register_range_type(:datetime)

    register 'rom', ROM.container(config)
  end
end

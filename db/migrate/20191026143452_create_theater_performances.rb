ROM::SQL.migration do
  change do
    create_table :theater_performances do
      primary_key :id
      DateTime :created_at, null: false, default: Sequel::CURRENT_TIMESTAMP
      String :name, null: false
      Date :start_date, null: false
      Date :end_date, null: false
      column :schedule, :jsonb
    end
  end
end

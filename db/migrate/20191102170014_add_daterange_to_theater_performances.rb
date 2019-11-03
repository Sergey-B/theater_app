ROM::SQL.migration do
  up do
    alter_table :theater_performances do
      add_column :duration, :daterange, null: false

      drop_column :schedule
      drop_column :start_date
      drop_column :end_date
    end
  end

  down do
    alter_table :theater_performances do
      drop_column :duration

      add_column :schedule, :jsonb
      add_column :start_date, :date, null: false
      add_column :end_date, :date, null: false
    end
  end
end

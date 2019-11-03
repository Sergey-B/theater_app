# frozen_string_literal: true

module TheaterApp
  module Main
    module Repositories
      class HolidaysRepo
        def by_date(date)
          holiday_by_date date
        end

        private

        def holiday_by_date(date)
          month_holidays = holidays[date.month]
          return unless month_holidays

          month_holidays.select { |h| h['mday'] == date.mday }.first
        end

        def holidays
          yaml = YAML
            .load_file('apps/main/config/holidays.yml')
            .with_indifferent_access

          yaml['months']
        end
      end
    end
  end
end

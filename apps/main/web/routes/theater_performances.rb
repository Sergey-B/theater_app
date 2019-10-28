# frozen_string_literal: true

module TheaterApp
  module Main
    class Web
      route 'theater_performances' do |r|
        r.is do
          r.get do
            r.resolve 'core.repositories.theater_performances_repo' do |theater_performances|
              { data: theater_performances.listing }
            end
          end

          r.post do
            r.resolve 'transactions.create_theater_performance' do |create_performance|
              attrs = r.params.slice('id', 'name', 'start_date', 'end_date')

              create_performance.call(attrs) do |m|
                m.success do |performance|
                  response.status = 201

                  { data: performance }
                end

                m.failure :validate do |error|
                  r.halt [422, { 'Content-Type' => 'application/json' }, [error.messages.to_json]]
                end

                m.failure do |error|
                  r.halt [422, { 'Content-Type' => 'application/json' }, [error.to_json]]
                end
              end
            end
          end
        end

        r.on :id do |id|
          r.delete do
            r.resolve 'transactions.delete_theater_performance' do |delete_performance|
              delete_performance.call(id: id) do |m|
                m.success do
                  r.halt 204
                end

                m.failure :validate do |error|
                  r.halt [422, { 'Content-Type' => 'application/json' }, [error.messages.to_json]]
                end

                m.failure do |error|
                  r.halt [422, { 'Content-Type' => 'application/json' }, [error.to_json]]
                end
              end
            end
          end
        end
      end
    end
  end
end

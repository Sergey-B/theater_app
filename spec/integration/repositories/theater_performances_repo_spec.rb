# frozen_string_literal: true

require 'web_spec_helper'

RSpec.describe 'core.repositories.theater_performances_repo' do
  subject :repository do
    TheaterApp::Main::Container['core.repositories.theater_performances_repo']
  end

  describe '#listing' do
    let(:attrs) do
      {
        id: 1,
        name: 'Performance Name',
        start_date: '2019-10-28',
        end_date: '2019-11-03'
      }
    end

    before do
      TheaterApp::Main::Container['transactions.create_theater_performance'].call attrs
    end

    it 'returns the schedule of theater performances' do
      result = repository.listing

      expect(result).to be
      expect(result).to including(
        including(
          'id' => attrs[:id],
          'name' => attrs[:name],
          'date' => attrs[:start_date]
        )
      )
    end
  end
end

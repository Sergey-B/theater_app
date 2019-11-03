# frozen_string_literal: true

require 'web_spec_helper'

RSpec.describe 'Theater Performances', type: :request do
  describe 'Creating a performance' do
    let(:attrs) do
      {
        id: 1,
        name: 'Name',
        start_date: 1.day.from_now,
        end_date: 1.week.from_now
      }
    end

    subject! do
      post_json 'theater_performances', data: attrs
    end

    it 'responds with the created performance' do
      expect(last_response.status).to eq 201

      expect(json_response).to include(
        'data' => including(
          'id' => attrs[:id]
        )
      )
    end
  end

  describe 'Get list of performances' do
    let(:attrs) do
      {
        id: 1,
        name: 'Name',
        start_date: 1.day.from_now.to_date,
        end_date: 1.week.from_now.to_date
      }
    end

    let! :theater_performance do
      TheaterApp::Main::Container['transactions.create_theater_performance'].call attrs
    end

    subject! do
      get_json 'theater_performances'
    end

    it 'responds with list of performances' do
      expect(last_response.status).to eq 200

      expect(json_response).to include 'data' => including(
        including(
          'id' => attrs[:id]
        )
      )
    end
  end

  describe 'Deleting a performance' do
    let(:attrs) do
      {
        id: 2,
        name: 'Name',
        start_date: 1.day.from_now,
        end_date: 1.week.from_now
      }
    end

    before do
      post_json 'theater_performances', data: attrs
    end

    subject do
      delete_json "theater_performances/#{attrs[:id]}"
    end

    it { is_expected.to be_empty }
  end
end

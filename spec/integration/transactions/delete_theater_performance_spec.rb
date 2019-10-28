# frozen_string_literal: true

require 'web_spec_helper'

RSpec.describe 'transactions.delete_theater_performance' do
  before do
    TheaterApp::Main::Container['transactions.create_theater_performance'].call \
      id: 1,
      name: 'Performance Name',
      start_date: 1.day.from_now.to_date,
      end_date: 1.week.from_now.to_date
  end

  let(:attrs) do
    {
      id: 1
    }
  end

  subject :delete_performance do
    TheaterApp::Main::Container['transactions.delete_theater_performance'].call attrs
  end

  it { is_expected.to be_success }

  context 'when invalid attrs' do
    let(:attrs) do
      {
        id: 'a'
      }
    end

    it { is_expected.to be_failure }
  end

  context 'when the theater performance with the specified id does not exist in the database' do
    let(:attrs) do
      {
        id: 2
      }
    end

    it { is_expected.to be_failure }
  end
end

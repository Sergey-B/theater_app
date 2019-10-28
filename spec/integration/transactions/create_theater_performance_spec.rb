require "web_spec_helper"

RSpec.describe "transactions.create_theater_performance" do
  let(:attrs) do
    {
      id: 1,
      name: "Performance Name",
      start_date: 1.day.from_now.to_date,
      end_date: 1.week.from_now.to_date
    }
  end

  subject :create_performance do
    TheaterApp::Main::Container["transactions.create_theater_performance"].call attrs
  end

  it "succeed" do
    expect(create_performance).to be_success

    performance = TheaterApp::Main::Container["core.repositories.theater_performances_repo"].by_id(attrs[:id])

    expect(performance).to be
    expect(performance.schedule).to be
  end

  context "when invalid attrs" do
    let(:attrs) do
      {
        id: 1,
        name: "Performance Name",
        start_date: 1.week.from_now.to_date,
        end_date: 1.day.from_now.to_date
      }
    end

    it { is_expected.to be_failure }
  end

  context "when already exists the theater performance with the same dates" do
    before do
      TheaterApp::Main::Container["transactions.create_theater_performance"].call \
        id: 2,
        name: "Performance",
        start_date: 1.day.from_now.to_date,
        end_date: 1.week.from_now.to_date
    end

    it "fails" do
      [
        { start_date: attrs[:start_date] + 1.day },
        { end_date: attrs[:end_date] - 2.day },
        { start_date: Date.current.to_date, end_date: 6.days.from_now.to_date },
        { start_date: Date.current.to_date, end_date: 8.days.from_now.to_date },
        { start_date: 2.days.from_now.to_date, end_date: 8.days.from_now.to_date }
      ].each { |dates|
        expect(
          TheaterApp::Main::Container["transactions.create_theater_performance"].call(
            attrs.merge(dates)
          )
        ).to be_failure
      }
    end
  end
end

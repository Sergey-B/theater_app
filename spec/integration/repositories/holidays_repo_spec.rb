require "web_spec_helper"

RSpec.describe "core.repositories.holidays_repo" do
  subject :repository do
    TheaterApp::Main::Container["core.repositories.holidays_repo"]
  end

  describe "#by_date" do
    it "filters" do
      result = repository.by_date "08.03.2019".to_date

      expect(result).to be
      expect(result[:name]).to eq "Международный женский день"

      result = repository.by_date "01.01.2019".to_date

      expect(result).to be
      expect(result[:name]).to eq "Новый год"

      result = repository.by_date "02.01.2019".to_date

      expect(result).to be
      expect(result[:name]).to eq "Новогодний праздник"
    end
  end
end

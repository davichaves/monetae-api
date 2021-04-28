require 'rails_helper'

RSpec.describe "ExchangeRates", type: :request do
  describe "GET /exchange_rates" do
    it "works! (now write some real specs)" do
      get exchange_rates_path
      expect(response).to have_http_status(200)
    end
  end
end

require "rails_helper"

RSpec.describe ExchangeRatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/exchange_rates").to route_to("exchange_rates#index")
    end

    it "routes to #show" do
      expect(:get => "/exchange_rates/1").to route_to("exchange_rates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/exchange_rates").to route_to("exchange_rates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/exchange_rates/1").to route_to("exchange_rates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/exchange_rates/1").to route_to("exchange_rates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exchange_rates/1").to route_to("exchange_rates#destroy", :id => "1")
    end
  end
end

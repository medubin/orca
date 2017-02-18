require 'flight_calculator.rb'
require 'json'


class FlightsController < ApplicationController
  def index
    the_params = {
        :departure_airport => "sfo",
        :country => "US",
        :currency => "USD",
        :locale => "en-US",
        :destination => "bdl",
        :outbound_date => "2016-12-16",
        :inbound_date => "2016-12-26",
        :cabin_class => "Economy",
        :adult => 1,
        :children => 0,
        :infants => 0,
    }
    flight_scanner = FlightCalculator.new

    session_key = flight_scanner.create_skyscanner_session(the_params)

    @flight_price_data = flight_scanner.get_flight_prices(session_key)

    if @flight_price_data
      @flight_price_data = flight_scanner.get_cheapest_flight(JSON.parse(@flight_price_data)["Itineraries"])
    end

  end
end

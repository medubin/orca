require 'flight_calculator.rb'
require 'qpx_express_helper.rb'
require 'skyscanner_helper.rb'
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
    flight_scanner = SkyscannerHelper.new
    @flight_price_data = flight_scanner.get_browse_cache_prices([])

    # session_key = flight_scanner.create_skyscanner_session(the_params)
    #
    # @flight_price_data = flight_scanner.get_flight_prices(session_key)
    #
    # if @flight_price_data
    #   @flight_price_data = flight_scanner.get_cheapest_flight(JSON.parse(@flight_price_data)["Itineraries"])
    # end

    # flight_cal = QPXExpressHelper.new
    # @flight_price_data = flight_cal.get_flight_prices([])

  end
end

require 'skyscanner_helper.rb'

class UpdateFlightPriceCache
  def index
    skyscanner_helper = SkyscannerHelper.new
    airports = Airport.select('airport_id, airport_code, city_id')
    airports.each do |airport|
      browse_cached_prices = skyscanner_helper.get_browse_cache_prices(airport['airport_code'])
      # TODO modify this for how cached prices really work
      browse_cached_prices.each do |cache_flight|
        destination_id = Airport.where('airport_code = ?', cache_flight['airport_code'])
        update_cache(destination_id, airport, cache_flight['price'])
      end
      region_id = Region.select('region_id').where('city_id = ?', airport['city_id'])
      popular_destinations = PopularDestination.select('destination_id').where('starting_region_id = ? AND destination_type = airport', region_id)
      popular_destinations.each do |destination_id|
        update_cache(destination_id, airport)
      end
    end
  end

  def update_cache(destination_id, airport, price = nil)
    previously_cached = FlightCache.where("origin_id = ? AND origin_id_type = 'airport' AND destination_id = ?
          AND destination_type", airport['airport_id'], destination_id)
    if price == nil
      skyscanner_helper = SkyscannerHelper.new
      # TODO make sure this works with the skyscanner session
      traveler = [destination_id => destination_id, origin_airport => airport]
      session = skyscanner_helper.create_skyscanner_session([traveler])
      flight_prices = session ? skyscanner_helper.get_flight_prices(session) : nil
      price = skyscanner_helper.get_cheapest_flight(flightPrices) if flight_prices
      if price == nil
        return nil
      end
    end
    if previously_cached
      previously_cached.price = price
      previously_cached.save
    else
      FlightCache.new(:origin_id => airport['airport_id'],
                     :origin_type => 'airport',
                     :destination_id => destination_id,
                     :destination_type => 'airport',
                     :price => price
      ).save
    end
  end
end

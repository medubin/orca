require 'date'
require 'skyscanner_helper.rb'

class UpdateFlightPriceCache
  def index
    skyscanner_helper = SkyscannerHelper.new
    airports = Airport.select('airport_id, airport_code, city_id')
    destinations = CacheDestination.select('code')
    airports.each do |airport|
      destinations.each do |destination|
        (0..51).each do |week|
          time = Time.now
          starting_date = Date.new(time.year, time.month, time.day)
          starting_date += week * 7
          ending_date += week * 14
          starting_date = starting_date.strftime('%Y-%m-%d')
          ending_date - ending_date.strftime('%Y-%m-%d')
          browse_cached_prices = skyscanner_helper.get_browse_cache_prices(airport['airport_code'], destination, starting_date, ending_date)
          browse_cached_prices.each do |cache_flight|
            update_cache('destination_cache_place', cache_flight['DestinationId'], airport, week, cache_flight['MinPrice'])
          end
        end
      end
      region_id = Region.select('region_id').where('city_id = ?', airport['city_id'])
      popular_destinations = PopularDestination.select('destination_id').where('starting_region_id = ? AND destination_type = airport', region_id)
      popular_destinations.each do |destination_id|
        (1..51).each do |week|
          traveler = [destination_id => destination_id, origin_airport => airport]
          session = skyscanner_helper.create_skyscanner_session([traveler])
          flight_prices = session ? skyscanner_helper.get_flight_prices(session) : nil
          price = flight_prices ? skyscanner_helper.get_cheapest_flight(flightPrices) : nil
          update_cache('airport', destination_id, airport, week, price) if price
        end
      end
    end
  end

  def update_cache(destination_type, destination_id, airport, week, price, round_trip = true)
    previously_cached = FlightCache.where("origin_id = ? AND origin_id_type = 'airport' AND destination_id = ?
          AND destination_type", airport['airport_id'], destination_id)

    if previously_cached
      previously_cached.price = price
      previously_cached.save
    else
      FlightCache.new(:origin_id => airport['airport_id'],
                      :origin_type => 'airport',
                      :destination_id => destination_id,
                      :destination_type => destination_type,
                      :price => price,
                      :week => week,
                      :round_trip => round_trip
      ).save
    end
  end
end

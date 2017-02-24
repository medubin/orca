class FlightCache < ApplicationRecord

  def get_destination_cache(starting_location, starting_type, price = nil, starting_date = nil, ending_date = nil)
  end

  def get_live_pricing(starting_locations, ending_locations, starting_date, ending_date)

  end

  def update_cache(destination_type, destination_id, airport, week, price, round_trip)
    cache_updater = UpdateFlightPriceCache.new
    puts cache_updater.update_cache(destination_type, destination_id, airport, week, price, round_trip)
  end

  def delete_flight_cache(flight_cache_id)
    flight_cache = FlightCache.find(flight_cache_id)
    flight_cache.delete
  end
end

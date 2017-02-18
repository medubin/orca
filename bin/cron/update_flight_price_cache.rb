require 'skyscanner_helper.rb'

class UpdateFlightPriceCache
  def index
    skyscanner_helper = SkyscannerHelper.new
    airports = Airport.select('airport_id, airport_code')
    airports.each do |airport|
      browse_cached_prices = skyscanner_helper.get_browse_cache_prices(airport['airport_code'])
      # TODO modify this for how cached prices really work
      browse_cached_prices.each do |cache_flight|
        destination_id = Airport.where('airport_code = ?', cache_flight['airport_code'])
        previously_cached = FlightCache.where("origin_id = ? AND origin_id_type = 'airport' AND destination_id = ?
          AND destination_type", airport['airport_id'], destination_id)
        if previously_cached
          previously_cached.price = cache_flight['price']
          previously_cached.save
        else
          new_cache = FlightCache.new
          new_cache.origin_id(airport['airport_id'])
          new_cache.origin_type('airport')
          new_cache.destination_id(destination_id)
          new_cache.destination_type('airport')
          new_cache.price(cache_flight['price'])
          new_cache.save
        end
      end
    end
  end
end
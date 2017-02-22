require '../../app/services/update_flight_price_cache.rb'

cache_updater = UpdateFlightPriceCache.new
cache_updater.create_and_cache


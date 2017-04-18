class Api::FlightCacheController  < ApplicationController
  def show
    traveler = params
    flight_cache = FlightCache.new
    @flight_cache = flight_cache.get_destination_cache(traveler[:origin],
                          traveler[:origin_type],
                          traveler[:price],
                          traveler[:starting_date],
                          traveler[:ending_date])
  end

  # this should only be used if there is no longer a way to get between two airports
  def destroy
     flight_cache_id = params[:flight_cache_id]
    return false if flight_cache_id.is_a? Integer

    delete_flight_cache(flight_cache_id)
  end

  def update
    flight_cache = FlightCache.new
    flight_cache.update_cache(params[:destination_type],
                              params[:destination_id],
                              params[:airport],
                              params[:week],
                              params[:price],
                              params[:round_trip])
  end
end

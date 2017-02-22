class Api::FlightCacheController  < ApplicationController
  def get_location_cache
    traveler = params[:raveler]

  end

  def delete_cache

  end

  def update_cache
    flight_cache = new FlightCache
    flight_cache.update_cache(params[:destination_type],
                              params[:destination_id],
                              params[:airport],
                              params[:week],
                              params[:price],
                              params[:round_trip])
  end
end
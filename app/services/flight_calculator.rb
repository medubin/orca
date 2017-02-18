require 'net/http'
require 'uri'
require 'json'
require 'date'

require 'httparty'
require 'json'

require 'skyscanner_helper'
class FlightCalculator

	def get_traveler_destinations(traveler_origin, traveling_date)
	# 	check DB to see if there are any places that are cheaper or equal to price specified by person or a little more based on the week of the year
	# 	return an array with destinations

	end

	# update destinations by the 5 count to save time
	def get_common_destinations(travelers, common_destinations, offset = 0, limit = 5)
		skyscanner_helper = SkyscannerHelper.new
		if limit != 0
			common_destinations = common_destinations.first(limit)
		end
		flight_options = []
		common_destinations.each do |destination|
			traveler_flight_options = []
			travelers.each_with_index do |traveler_key, traveler|
				# sessions are based on destination so create new session per destination
				session = skyscanner_helper.create_skyscanner_session(traveler)
				flight_prices = skyscanner_helper.get_flight_prices(session)
				if flight_prices
					flight_prices = skyscanner_helper.get_cheapest_flight(JSON.parse(flight_prices)['Itineraries'])
					cheapest_flight = get_cheapest_flight(flight_prices)
					if cheapest_flight <= traveler.max_price
						traveler_flight_options[traveler_key] = cheapest_flight
					else
						break
					end
				end
			end
			flight_options[destination] = traveler_flight_options
		end
		flight_options
	end

	def get_week_by_date(traveling_date)
		traveling_array = traveling_date.split('-')
		day_of_year = Date.new(traveling_date[0], traveling_date[1], traveling_date[2]).yday
		day_of_year/7
	end

	def get_popular_destinations(travelers, traveling_date)
		week = get_week_by_date(traveling_date)
		# common_destinations = pull popular destinations based on traveling week and travler origin region
		# return common destinations and on front end call get_common_destinations api based on a limit of 5 and the offset
	end

end
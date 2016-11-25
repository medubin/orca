type = "post"

apiParams = {
	"content-type" => 'application/x-www-form-urlencoded',
	"accept" => 'application/json',
	"cache-control" => 'no-cache'
	"body" => "OriginPlace=#{params['departure_airport']}-iata&Country=#{params['country']}&Currency=#{params['currency']}&DestinationPlace=#{params['destination']}-iata&OutboundDate=#{params['outbound_date']}&Locale=#{params['locale']}"
}



#TODO this is done in the front end
# origins = hash: airport => [users => prices]
def getFlights origins, date
	popDestinations = getPopularDestinations
	destinations = {}
	popDestinations do |destination|
		origins.each do |airport, users| 
			destinations.destination[airport] = price
		end
		return destination
	end

end

def getPopularDestinations origins, date
	season = getSeason(date)
	destinations = [];
	origins.each do |airport, _|
		destinations += memcache.getdestinations(airport, date)
	end
	if count(destinations) < 100
		destinations += memcache.getMostPopularDestinations(100 - count(destinations), season)
	end

	return destinations

end

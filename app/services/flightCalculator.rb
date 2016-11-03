require 'net/http'
require 'uri'
require 'json'

def createSkyscannerSession(params)
	url = URI("http://partners.api.skyscanner.net/apiservices/pricing/v1.0?apiKey=" << ENV['skyscanner'])

	http = Net::HTTP.new(url.host, url.port)

	request = Net::HTTP::Post.new(url)
	request["content-type"] = 'application/x-www-form-urlencoded'
	request["accept"] = 'application/json'
	request["cache-control"] = 'no-cache'
	request.body = "OriginPlace=#{params['departure_airport']}-iata&Country=#{params['country']}&Currency=#{params['currency']}&DestinationPlace=#{params['destination']}-iata&OutboundDate=#{params['outbound_date']}&Locale=#{params['locale']}"
	response = http.request(request)

	if response.code != "201"
	  session_id = nil
	else
	  polling_url = response["location"]
	  session_id = polling_url.split('/').last

	  return session_id
	end
end

def getFlightPrices(params)
	url = URI("http://partners.api.skyscanner.net/apiservices/pricing/v1.0/#{params['sessionKey']}?apiKey=prtl6749387986743898559646983194")

	http = Net::HTTP.new(url.host, url.port)

	request = Net::HTTP::Get.new(url)
	request["content-type"] = 'application/x-www-form-urlencoded'
	request["accept"] = 'application/json'
	request["cache-control"] = 'no-cache'
	request.body = ""
	puts request.body
	response = http.request(request)
	puts response
	puts response.body

	if response.code != "201"
	  session_id = nil
	else
	  polling_url = response["location"]
	  session_id = polling_url.split('/').last

	  return session_id
	end
end	

theParams = {
	"departure_airport" => "sfo",
	"country" => "US",
	"currency" => "USD",
	"locale" => "en-US",
	"destination" => "bdl",
	"outbound_date" => "2016-12-16",
	"inbound_date" => "2016-12-26",
	"cabin_class" => "Economy",
	"adult" => 1,
	"children" => 0,
	"infants" => 0,
}

sessionKey = createSkyscannerSession(theParams)

flightParams = {
	"sessionKey" => sessionKey,
}

puts getFlightPrices(flightParams)


#TODO this is done in the front end
# origins = hash: airport => [users => prices]
def getFlights origins, date
	popDestinations = getPopularDestinations
	destinations = {}
	popDestinations do |destination|
		origins.each do |airport, users| 
			destinations.de     nstination[airport] = price
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

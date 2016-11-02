require 'net/http'

url = URI.parse('http://partners.api.skyscanner.net/apiservices/pricing/v1.0')
req = Net::HTTP::Post.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}

puts res.header



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

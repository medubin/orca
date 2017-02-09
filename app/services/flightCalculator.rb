require 'net/http'
require 'uri'
require 'json'

require 'httparty'
require 'json'
class FlightCalculator

	def createSkyscannerSession(params)
		uri = URI("http://partners.api.skyscanner.net/apiservices/pricing/v1.0")

		http = Net::HTTP.new(uri.host, uri.port)
		req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/x-www-form-urlencoded', 'Accept' => 'application/json')
		req.body= URI.encode_www_form({
			# 	for now this is hard coded until front end is implemented
			# 	using skyscanners demo apiKey
			apiKey:'prtl6749387986743898559646983194',
			country:'us',
			currency:'usd',
			locale:'en-us',
			originplace:'BDL-iata',
			destinationplace:'SFO-iata',
			outbounddate:'2017-12-12',
			adults:'1' })

		response = http.request(req)

		if response.code != "201"
			return nil
		end

		polling_url = response["location"]
		return polling_url.split('/').last
	end

	def getFlightPrices(params)
		url = URI("http://partners.api.skyscanner.net/apiservices/pricing/v1.0/#{params['sessionKey']}?apiKey=prtl6749387986743898559646983194")

		http = Net::HTTP.new(url.host, url.port)

		request = Net::HTTP::Get.new(url)
		request["content-type"] = 'application/x-www-form-urlencoded'
		request["accept"] = 'application/json'
		request["cache-control"] = 'no-cache'
		request.body = ""
		response = http.request(request)

		return response.code == "200" ? response.body : nil

	end

#
# #TODO this is done in the front end
# # origins = hash: airport => [users => prices]
# 	def getFlights origins, date
# 		popDestinations = getPopularDestinations
# 		destinations = {}
# 		popDestinations do |destination|
# 			origins.each do |airport, users|
# 				destinations.de     nstination[airport] = price
# 			end
# 			return destination
# 		end
#
# 	end
#
# 	def getPopularDestinations origins, date
# 		season = getSeason(date)
# 		destinations = [];
# 		origins.each do |airport, _|
# 			destinations += memcache.getdestinations(airport, date)
# 		end
# 		if count(destinations) < 100
# 			destinations += memcache.getMostPopularDestinations(100 - count(destinations), season)
# 		end
#
# 		return destinations
#
# 	end

end
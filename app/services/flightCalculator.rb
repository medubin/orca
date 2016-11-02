require 'net/http'

url = URI.parse('http://partners.api.skyscanner.net/apiservices/pricing/v1.0')
req = Net::HTTP::Post.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}

puts res.header



# origins = hash: airport => [users => prices]
def getFlights origins, date
	destinations = [];
	origins.each do |airport, users| 
		destinations.push('likely destinations from db')



	end

end
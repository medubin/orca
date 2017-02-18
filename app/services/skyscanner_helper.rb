require 'httparty'
require 'byebug'


class SkyscannerHelper
  def create_skyscanner_session(traveler)
    uri = URI('http://partners.api.skyscanner.net/apiservices/pricing/v1.0')

    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/x-www-form-urlencoded', 'Accept' => 'application/json')
    req.body= URI.encode_www_form({
                                      # 	for now this is hard coded until front end is implemented
                                      # 	using skyscanners demo apiKey
                                      # 	will call each part of travler
                                      apiKey:'prtl6749387986743898559646983194',
                                      country:'us',
                                      currency:'usd',
                                      locale:'en-us',
                                      originplace:'SFO-iata',
                                      destinationplace:'BDL-iata',
                                      outbounddate:'2017-12-12',
                                      adults:'1' })

    response = http.request(req)

    if response.code != '201'
      return nil
    end

    response.code != '201' ? response['location'].split('/').last : nil
  end

  def get_flight_prices(session)
    url = URI("http://partners.api.skyscanner.net/apiservices/pricing/v1.0/#{session}?apiKey=prtl6749387986743898559646983194")
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    request['content-type'] = 'application/x-www-form-urlencoded'
    request['accept'] = 'application/json'
    request['cache-control'] = 'no-cache'
    request.body = ''
    response = http.request(request)
    response.code == '200' ? response.body : nil
  end

  def get_cheapest_flight(flight_prices)
    lowest_price = nil
    best_price_option = nil
    flight_prices.each do |price_option|
      price = price_option['PricingOptions'][0]['Price']
      if lowest_price == nil or lowest_price > price
        lowest_price = price
        best_price_option = priceOption
      end
    end
    best_price_option
  end

  def get_browse_cache_prices(airport_origin)
    HTTParty.get("http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/us/usd/us-en/sfo-iata/anywhere/2017-12-16/?apiKey=prtl6749387986743898559646983194",
                  :headers => { 'Content-Type' => 'application/json' })
  end
end
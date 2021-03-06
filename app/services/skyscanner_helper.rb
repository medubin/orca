require 'httparty'
require 'byebug'


class SkyscannerHelper
  def create_skyscanner_session(traveler)
    uri = URI('http://partners.api.skyscanner.net/apiservices/pricing/v1.0')

    city = City.find(traveler[airport['city_id']])
    airport_code = traveler[airport['code']] + '-iata'
    destination_code = Airport.select(code).find(traveler[destination_id]) + '-iata'

    http = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/x-www-form-urlencoded', 'Accept' => 'application/json')
    req.body= URI.encode_www_form({
                                      # 	using skyscanners demo apiKey
                                      apiKey:'prtl6749387986743898559646983194',
                                      country: city['country'],
                                      currency: city['currency'],
                                      locale: city['locale'],
                                      originplace: airport_code,
                                      destinationplace:destination_code,
                                      outbounddate:traveler['starting_date'],
                                      inbounddate: traveler['ending_date'],
                                      adults:'1' })

    response = http.request(req)

    if response.code != '201'
      return nil
    end

    response.code != '201' ? response['location'].split('/').last : nil
  end

  def get_flight_prices(session)
    if session == nil
      return nil
    end
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
    if flight_prices == nil
      return nil
    end
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

  def get_browse_cache_prices(airport_code, destination, starting_date, ending_date)
    city = City.find(airport['city_id'])
    if city == nil
      return nil
    end
    airport_code = airport_code + '-iata'
    HTTParty.get("http://partners.api.skyscanner.net/apiservices/browsequotes/v1.0/?/?/?/?/?/?/?/?apiKey=prtl6749387986743898559646983194",
                 city['country'],
                 city['currency'],
                 city['locale'],
                 airport_code,
                 destination,
                 starting_date,
                 ending_date,
                 :headers => { 'Content-Type' => 'application/json' })
  end
end
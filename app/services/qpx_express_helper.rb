require 'httparty'
require 'byebug'

class QPXExpressHelper
  def get_flight_prices(traveler)

    HTTParty.post("https://www.googleapis.com/qpxExpress/v1/trips/search?key=",
                  :body =>  {
                      "request": {
                          "passengers": {
                              "kind": "qpxexpress#passengerCounts",
                              "adultCount": 1,
                              "childCount": 0,
                              "infantInLapCount": 0,
                              "infantInSeatCount": 0,
                              "seniorCount": 0
                          },
                          "slice": [
                              {
                                  "kind": "qpxexpress#sliceInput",
                                  "origin": 'sfo',
                                  "destination": "bdl",
                                  "date": "2017-12-16",
                                  "maxStops": 1,
                                  "preferredCabin": "COACH",
                              }
                          ],
                          "maxPrice": "usd300",
                          "refundable": false,
                          "solutions": 10
                      }
                  }.to_json,
                  :headers => { 'Content-Type' => 'application/json' })
  end


end
Schema:


Airport
- Name, city_id, airport_code, lat, long,

City
- Name, country, lat, long

Historical_data
- Starting_airport_id, destination_airport_id, lowest_price, airline_id, date

flight_cache_aggregation
- starting_airport_id, destination_airport_id, average_lowest_price, airline_id, api_id, sample_size
(starting_airport_id, destination_airport_id, airline_id) index


apis
api_name, api_url

api_parameters
look at apis first???

airline
-airline_name

airline_partner
- airline, partner (or airline is it directional?)

close_airport
-origin_airport, airport // doubles the table size. better way to do this?



View:
Enter location page
Search Results Page


Stack:
React/Redux
<-jbuilder->
Rails
Postgresql
Heroku/DO


TODO:
Create a readme -> list all steps -md
Set up Rails -md
Set up React/Redux -md
    -Set up store, dispatcher

Create Tables    -ss
    -list all tables in readme

research apis -ss, md
    -what can we query (1)
        - can we wildcard destination city
    - how the results going to be formatted (5)
    - limit results
    - sort results

    Flights: 
    travelpayouts
    dohop
    flight stats
    expedia
    google flights

    Hotels :
    hotlescombined
    booking.com


MVP: As a user, I go to whatever site and I am able to add multiple origins and an optional destination and find options based on price + budget constraints for different origins + optional date. Flights/Hotels/Activites/Cars
V2 Features:

Driving options (length of time to drive, having a car/renting a car)
Book on site


Front End: React/Redux
Back: 

Flights: 
travelpayouts
dohop
flight stats
expedia
google flights

Hotels :
hotlescombined
booking.com






MVP API:
- Takes multiple users
- and their origins
- returns list of airports by price

Algorithm MVP
- Parameters: array of starting airports
- 
- returns array of ending airports => array [price, name, etc.]





Week 2 todo:
<!-- Stef -->
- make models
- API search - multi destination
- Rough draft of popular destination algorithm
<!-- Matt -->
- Build mockup of front page
- Implement redux

schema v2
//Users







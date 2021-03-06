User.create(first_name: "justin", last_name: "wong", password: "123", email: "justin@dbc.com", phone: "415-845-9551")
# User.create(first_name: "erica", last_name: "freeman", password_hash: "123", email: "erica@theinternet.com")

20.times do (
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "123", email: Faker::Internet.email, phone: Faker::Number.number(9).to_s))
end

Event.create(event_name: "Sports-ball game", event_description: "Lets get together and watch the sports-ball game at my place!", street: "697 Frederick Street", city: "San Francisco", state: "California", postcode: "94117", start_time: Faker::Time.forward(rand(1..5), :morning), end_time: Faker::Time.forward(rand(6..9), :evening), host_id: rand(1..20))

Event.create(event_name: "Lakeside Lunch", event_description: "Let's have lunch in Oakland!", street: "KronnerBurger", city: "Oakland", state: "California", postcode: "94611", start_time: Faker::Time.forward(rand(1..5), :morning), end_time: Faker::Time.forward(rand(6..9), :evening), host_id: rand(1..20))

Event.create(event_name: "Movie night", event_description: "Come to my place and watch a movie on my giant backyard projector!", street: "63 Locust Ave", city: "Mill Valley", state: "California", postcode: "94941", start_time: Faker::Time.forward(rand(1..5), :morning), end_time: Faker::Time.forward(rand(6..9), :evening), host_id: rand(1..20))

Event.create(event_name: "Walk through the park", event_description: "I want to walk from the panhandle to the beach and back.  Lets meet at my house!", street: "697 Frederick Street", city: "San Francisco", state: "California", postcode: "94117", start_time: Faker::Time.forward(rand(1..5), :morning), end_time: Faker::Time.forward(rand(6..9), :evening), host_id: rand(1..20))

Event.create(event_name: "Bike ride to the city", event_description: "I want to do the 49 mile bike ride through the city.  Let's meet at the Whole Foods before we depart!", street: "Whole Foods Market Blithedale", city: "Mill Valley", state: "California", postcode: "94941", start_time: Faker::Time.forward(rand(1..5), :morning), end_time: Faker::Time.forward(rand(6..9), :evening), host_id: rand(1..20))

Event.create(event_name: "Dinner by the water", event_description: "I want to go to Barrel House Tavern in Sausalito for dinner.  My treat!", street: "Barrel House Tavern", city: "Sausalito", state: "California", postcode: "94920", start_time: Faker::Time.forward(rand(1..5), :morning), end_time: Faker::Time.forward(rand(6..9), :evening), host_id: rand(1..20))

Event.create(event_name: "Hike through Muir Woods", event_description: "Let's go walk through the mist at Muir Woods!", street: "Muir Woods", city: "Mill Valley", state: "California", postcode: "94941", start_time: Faker::Time.forward(rand(1..5), :morning), end_time: Faker::Time.forward(rand(6..9), :evening), host_id: rand(1..20))

30.times do (
	Guest.create(user_id: rand(2..20), event_id: rand(1..7)))
end

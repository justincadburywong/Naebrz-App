User.create(first_name: "justin", last_name: "wong", password_hash: "123", email: "justin@theinternet.com", address: "429 E Blithedale Ave, Mill Valley, Ca 94941")
User.create(first_name: "erica", last_name: "freeman", password_hash: "123", email: "erica@theinternet.com", address: "423 E Blithedale Ave, Mill Valley, Ca 94941")

20.times do (
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password_hash: "123", email: Faker::Internet.email, address: Faker::Address.street_address))
end
# Event.create(event_name: "movie night", location: "423 E Blithedale Ave, Mill Valley, Ca 94941", date: 2016-06-15, start_time: 17-00-00, end_time: 21-00-00, host_id: 2)
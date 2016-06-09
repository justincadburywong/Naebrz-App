get '/' do
	@events = Event.all
  erb :index
end

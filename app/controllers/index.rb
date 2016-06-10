get '/' do
	@events = Event.all.order("created_at DESC")
  erb :index
end

get '/events/new' do
	erb :'events/new'
end

## create a new event
post '/events' do
	event = Event.new(host_id: current_user.id, event_name: params[:event_name], event_description: params[:event_description], street: params[:street], city: params[:city], state: params[:state], postcode: params[:postcode], start_time: params[:start_time], end_time: params[:end_time])
	if event.save
    redirect '/'
  else
    @error = "You broke the internet.  Please try again!"
    erb :'/events/new'
  end
end

## see an event
get '/events/:id' do
	@event = Event.find(params[:id])
  @guestlist = @event.guests
	@be_there_by = make_pretty_time(@event.start_time)
  if current_user
    @on_guestlist = @guestlist.find_by(user_id: current_user.id)
  end
	erb :'events/show'
end

## page to edit an event
get '/users/:user_id/events/:id' do
  @event = Event.find(params[:id])
  erb :'/events/edit'
end

## edit the event
put '/users/:user_id/events/:id' do
  event = Event.find(params[:id])
  event.update(event_name: params[:event_name], event_description: params[:event_description], street: params[:street], city: params[:city], state: params[:state], postcode: params[:postcode], start_time: params[:start_time], end_time: params[:end_time])
  redirect "/users/#{params[:user_id]}"
end

## add yourself to the guestlist
post '/users/:user_id/events/:id/guests' do
  @guest = Guest.create(event_id: params[:id], user_id: current_user.id)
	# send_join_text
  redirect "/events/#{params[:id]}"
end

## remove yourself from the guestlist
post '/users/:user_id/events/:id/guest' do
	@me = Guest.find_by(user_id: current_user.id, event_id: params[:id])
	@me.destroy
	redirect "/events/#{params[:id]}"
end

delete '/users/:user_id/events/:id' do
  @event = Event.find(params[:id])
	@user = User.find(params[:user_id])
	@guests = []
	@event.guests.each do |x| @guests << x.user_id end
	## send everybody a cancelation email
	pony_cancel_event_email
  @event.destroy
  redirect "/users/#{params[:user_id]}"
end

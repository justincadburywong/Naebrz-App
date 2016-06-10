get '/event/new' do
	erb :'events/new'
end

post '/event/new' do
	Event.create(host_id: session[:user_id], event_name: params[:event_name], event_description: params[:event_description], street: params[:street], city: params[:city], state: params[:state], postcode: params[:postcode], start_time: params[:start_time], end_time: params[:end_time])
	redirect '/'
end

get '/event/:id' do
	@event = Event.find(params[:id])
	erb :'events/show'
end

get '/users/:user_id/event/:id' do
  @event = Event.find(params[:id])
  erb :'/events/edit'
end

post '/users/:user_id/event/:id' do
  event = Event.find(params[:id])
  gatherings = Gatherings.all
  gatherings.update(event_id: params[:id], guest_id: sessions[:id])
  redirect "/users/#{params[:user_id]}"
end

put '/users/:user_id/event/:id' do
  event = Event.find(params[:id])
  event.update(event_name: params[:event_name], event_description: params[:event_description], street: params[:street], city: params[:city], state: params[:state], postcode: params[:postcode], start_time: params[:start_time], end_time: params[:end_time])
  redirect "/users/#{params[:user_id]}"
end

delete '/users/:user_id/event/:id' do
  @event = Event.find(params[:id])
  @event.destroy
  redirect "/users/#{params[:user_id]}"
end
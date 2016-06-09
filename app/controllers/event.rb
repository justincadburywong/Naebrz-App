get '/event/new' do
	erb :'events/new'
end

post '/event/new' do
	Event.create(host_id: session[:user_id], event_name: params[:event_name], street: params[:street], city: params[:city], state: params[:state], postcode: params[:postcode], start_time: params[:start_time], end_time: params[:end_time])
	redirect '/'
end

get '/event/:id' do
	@event = Event.find(params[:id])
	erb :'events/show'
end

put '/users/:user_id/event/:id' do
	event = Event.find(params[:id])
	event.update()
	redirect "/event/#{params[:id]}"
end

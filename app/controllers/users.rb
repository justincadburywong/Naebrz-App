# aka Register
get '/users/new' do
  erb :'users/new'
end

post '/users/new' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password_hash: params[:password_hash])
  if @user.save
    session[:id] = @user.id
    redirect '/sessions/new'
  else
    #error handling goes here
    redirect '/users/new'
  end
end

#aka Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end


delete '/users/:user_id/event/:id' do
  @event = Event.find(params[:id])
  @event.destroy
  redirect "/users/#{params[:user_id]}"
end
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
  @event = Event.all
  @user = User.find(params[:id])
  @gatherings = Gathering.all
  erb :'users/show'
end


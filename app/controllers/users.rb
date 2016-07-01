# aka Register
get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
  if @user.save
    redirect '/sessions/new'
  else
    #error handling goes here
    @error = "Sorry, that email is already taken.  Please try again"
    erb :'/users/new'
  end
end

#aka Profile page
get '/users/:id' do
  @event = Event.all
  @user = User.find(params[:id])
  @guestlist = Guest.all
  erb :'users/show'
end


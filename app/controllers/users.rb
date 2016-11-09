# aka Register
get '/users/new' do
  erb :'users/new'
end

post '/users' do
  if params[:password] == params[:password2]
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], phone: params[:phone])
    if @user.save
      # send the welcome email!
      # pony_welcome_email
      mail_welcome_email
      # log them in!
      session[:id] = @user.id
      redirect '/'
    else
      #error handling goes here
      @error = "Sorry, that email is already taken.  Please try again."
      erb :'/users/new'
    end
  else
    @error = "Your passwords don't match!  Please try again!"
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

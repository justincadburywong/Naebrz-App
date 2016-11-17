# aka Register
get '/users/new' do
  erb :'users/new'
end

post '/users' do
  if params[:password] == params[:password2]
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], phone: params[:phone])
    if @user.save
      # send the welcome email!
      pony_welcome_sendmail
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
  if current_user
    if params[:id] = current_user.id
      @user = User.find(params[:id])
      @confirmed_guestlist = Guest.where(user_id: @user.id)
      @events = []
      @confirmed_guestlist.each do |x| @events << Event.find(x.event_id) end
      erb :'users/show'
    else
      redirect '/'
    end
  else
    redirect '/users/new'
  end
end

# aka "Login"
get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  #find user based on email address
  @user = User.find_by(email: params[:email])
  #validate user based on valid password
  #if it does
  #&& is checking if user is not nill !!
  if @user && @user.authenticate(params[:password])
    #set the user-id to session
    session[:id] = @user.id
    redirect '/'
  else
    @error = "Your email or password was incorrect"
    erb :'/sessions/new'
  end
end

get '/sessions/delete' do
  logout
  redirect '/'
end

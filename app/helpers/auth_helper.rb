helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def logout
  	session[:id] = nil
  	current_user = nil
	end

end

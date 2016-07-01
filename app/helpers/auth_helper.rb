# require 'pony'

helpers do
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  def logout
  	session[:id] = nil
  	current_user = nil
	end

	def send_email(opts={})
  # Pony.mail(:to => 'aberger019@gmail.com', :from => 'me@example.com', :subject => 'hi', :body => 'Hello there.')
  p opts
  Pony.mail(:to => opts[:to],
            :from => opts[:from],
            :subject => opts[:subject], 
            :body => opts[:body])
  end

end

helpers do
	def pony_welcome_sendmail
    Pony.mail(:to => @user.email,
							:from => 'noreply@naebrz.com',
							:subject => 'Welcome to the Naebrhood!',
							:body => 'Hello there.  Thanks for registering at Naebrz.  You can access your events at Https://naebrz.herokuapp.com.',
							:via => :sendmail)
  end

	def pony_welcome_smtp
		Pony.mail({:to => @user.email,
							 :from => 'noreply@naebrz.com',
							 :subject => 'Welcome to the Naebrhood!',
							 :body => 'Hello there.  Thanks for registering at Naebrz.  You can access your events at Https://naebrz.herokuapp.com.',
	  				 	 :via => :smtp,
	  			 		 :via_options => {
					     :address        => 'email-smtp.us-east-1.amazonaws.com',
					     :port           => '25',
					     :user_name      => SMTP_USER,
					     :password       => SMTP_PASS,
					     :authentication => :plain, # :plain, :login, :cram_md5, no auth by default
					     :domain         => "localhost.localdomain" # the HELO domain provided by the client to the server
						   }
						 })
	end
end

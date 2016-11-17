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

	def pony_cancel_event_email
		@guests.each do |guest|
			Pony.mail(:to => User.find(guest).email,
								:from => 'noreply@naebrz.com',
								:subject => "#{@user.first_name} cancelled their event!",
								:body => "Sorry to bother you, but #{@user.first_name} cancelled their event: #{@event.event_name}",
								:via => :sendmail)
		end
	end
end

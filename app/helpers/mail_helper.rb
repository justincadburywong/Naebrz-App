helpers do
	def pony_welcome_email
    Pony.mail(:to => @user.email, :from => 'noreply@naebrz.com', :subject => 'Welcome to the Naebrhood!', :body => 'Hello there.  Thanks for registering.  You can access your events at Https://naebrz.herokuapp.com.')
  end

  def mail_welcome_email
    Mail.deliver do
      from      'noreply@naebrz.com'
      to        'vitaminjuice@gmail.com'
      subject   'Welcome to the Naebrhood!'
      body      'Hello there.  Thanks for registering.  You can access your events at Https://naebrz.herokuapp.com.'
    end
  end
end

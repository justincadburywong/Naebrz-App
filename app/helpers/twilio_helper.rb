helpers do

  def send_welcome_text
  account_sid = TWILIO_SID
  auth_token = TWILIO_TOKEN
  client = Twilio::REST::Client.new account_sid, auth_token

  from = "4152752620"

    client.account.messages.create(
      :from => from,
      :to => @user.phone,
      :body => "Welcome to Naebrz, #{@user.first_name}!  Create an event or browse other's events!"
    )
    puts "Sent message to #{@user.first_name} / #{@user.phone}."
  end

  def send_join_text
    account_sid = TWILIO_SID
    auth_token = TWILIO_TOKEN
    client = Twilio::REST::Client.new account_sid, auth_token
    @event = Event.find(@guest.event_id)
    @host = User.find(@event.host_id)
    from = "4152752620"

      client.account.messages.create(
        :from => from,
        :to => current_user.phone,
        :body => "This is a reminder that you've joined #{@host.first_name}'s event!  Don't forget to be available at #{@event.start_time}"
      )
      puts "Sent message to #{current_user.first_name} / #{current_user.phone}."
  end
end

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
end

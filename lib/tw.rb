module Tw


  def make_twilio_client
    Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send_message to, message
    client = self.make_twilio_client
    client.account.messages.create({
      :from => '+14846794637',
      :to => to,
      :body => message # :message
    })
  end

end
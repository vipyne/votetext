module Twilioer

  def make_client
    Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send_message to, message)
    client = Twilioer.make_client
    client.account.messages.create({
      :from => '+14846794637',
      :to => '+16104204483',
      :body => message # :message
    })
  end

end
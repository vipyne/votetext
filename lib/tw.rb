module Tw


  def make_client
    p 'got to make_client'
    p ENV["ACCOUNT_SID"]
    p ENV["AUTH_TOKEN"]
    Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send_message to, message
    client = self.make_client
    client.account.messages.create({
      :from => '+14846794637',
      :to => to,
      :body => message # :message
    })
  end

end
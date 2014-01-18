module Tw


  def make_twilio_client
    Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send_message message
    client = self.make_twilio_client
    client.account.messages.create({
      :from => "+14846794637",
      :to => "+#{current_user.phonenumber}",
      :body => message # :message
    })
  end

end
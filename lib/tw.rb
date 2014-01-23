module Tw

  def make_twilio_client
    Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send_message show_hash
    now = Time.now
    message = []
    show_hash.each do |date, election|
      elec_date = date
      the_when = Chronic.parse("#{elec_date}")
      message << now - the_when
    end
    client = self.make_twilio_client
    client.account.messages.create({
      :from => "+14846794637",
      :to => "+#{current_user.phonenumber}",
      :body => message.to_s # :message
    })
  end

end
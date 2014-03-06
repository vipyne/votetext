module Tw

  def make_twilio_client
    Twilio::REST::Client.new ENV["ACCOUNT_SID"], ENV["AUTH_TOKEN"]
  end

  def send_message show_hash
    dates = []
    elections = []
    show_hash.each do |date, election|
      dates << date
      elections << election
    end
    message = "you will receive a text on #{dates.join(', ')}
    to remind you of the #{elections.join(', ')}"
    client = self.make_twilio_client
    client.account.messages.create({
      :from => "+14846794637",
      :to => "+#{current_user.twilio_phonenumber current_user}",
      :body => message
    })
  end

  def send_reminder
    # need to set up rake task to send texts day of election
  end

end
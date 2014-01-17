class TwilioersController < ApplicationController

  @client = Twilioer.make_client
  @client.account.messages.create(
    :from => "14846794637",
    :to => "16104204483",
    # :to => User.find_by_id(session[:id]).phone_number,
    :body => "sup"
    )

end
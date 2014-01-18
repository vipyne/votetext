class TextsController < ApplicationController

  def create
    @client = Twilioer.make_twilio_client
    @client.account.messages.create({
      :from => '+14846794637',
      :to => '+16104204483',
      :body => 'supp yo', # :message
    })
  end

end
class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper
  include Tw
  include Civicaide

  def make_message
    # google civic info api ish
  end

end

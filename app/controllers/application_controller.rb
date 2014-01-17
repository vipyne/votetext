class ApplicationController < ActionController::Base
  protect_from_forgery
  include Tw

  def make_message
    # google civic info api ish
  end
end

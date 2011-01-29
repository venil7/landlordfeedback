class PageController < ApplicationController
  #rescue_from ActionController::RoutingError, :with => :render_error
  protect_from_forgery
  before_filter :no_id_check, :only=>[:view]
  
  def initialize()
    super()
    get_latest_feedbacks()
    get_latest_properties()
  end
  
  def redirect_to_login
    redirect_to :controller=>:auth, :action=>:fblogin
  end
  
  def is_returning_user!
    cookies[:returning_user] = { :value => true, :expires => 5.years.from_now }  
  end
  
  def is_returning_user?
    request.cookies[:returning_user]
  end
  
  def get_latest_feedbacks
    @latest_feedbacks = Feedback.first(3) or []
  end
  
  def get_latest_properties
    @latest_properties = Property.first(3) or []
  end
  
  def added_unsuccessfully_message(entry = :entry)
    "Can't add #{entry}, please check all fields and try agan"
  end
  
  def added_successfully_message(entry = :entry, entries = nil)
    message = "Thank you, #{entry} added successfully"
    message < ", please add some #{entries}" if (entries)
    return message
  end
  
  private 
  def no_id_check
    redirect_to root_path if params[:id] == nil
  end
end

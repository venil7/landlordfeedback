class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :no_id_check, :only=>[:view]
  
  def initialize()
    super()
    get_latest_feedbacks()
    get_latest_properties()
  end
  
  def user_info
      session[:user_info]
  end

  def user_logged_in?
      user_info != nil
  end

  def user_alias
      user_info[:id] if user_logged_in?
  end
  
  def user_id
      session[:user_id] if user_logged_in?
  end
  
  def user_name
      user_info[:name] if user_logged_in?
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
    @latest_feedbacks = Feedback.last(3) or []
  end
  
  def get_latest_properties
    @latest_properties = Property.last(3) or []
  end
  def added_unsuccessfully_message(entry = :entry)
    "Can't add #{entry}, please check all fields and try agan"
  end
  
  def added_successfully_message(entry = :entry, entries = nil)
    message = "Thank you, #{entry} added successfully"
    message < ", please add some #{entries}" if (entries)
    return message
  end
  
  protected
  def fb_client
    @client ||= FBGraph::Client.new(:client_id => APP_CONFIG['client_id'],
                                    :secret_id => APP_CONFIG['secret_id'],
                                    :token => session[:access_token])
  end
  
  
  private 
  def no_id_check
    redirect_to root_path if params[:id] == nil
  end
end

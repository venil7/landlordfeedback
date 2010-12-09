class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def initialize()
    super()
    get_latest_feedbacks()
  end
  
  protected
  def fb_client
    @client ||= FBGraph::Client.new(:client_id => '154612174572644',
                                    :secret_id => '1d805d27dd7492cfe3b2ce6f8c4ccbf5',
                                    :token => session[:access_token])
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
    redirect_to :controller=>"auth", :action=>"fblogin"
  end
  
  def is_returning_user!
    cookies[:returning_user] = { :value => true, :expires => 5.years.from_now }  
  end
  
  def is_returning_user?
    request.cookies[:returning_user]
  end
  
  def get_latest_feedbacks
    @latest_feedbacks = Feedback.last(3) or [Feedback.new]
  end
  
end

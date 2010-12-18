class ApplicationController < ActionController::Base
  def initialize
    super()
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
  
  protected
  def fb_client
    @client ||= FBGraph::Client.new(:client_id => APP_CONFIG['client_id'],
                                    :secret_id => APP_CONFIG['secret_id'],
                                    :token => session[:access_token])
  end
end

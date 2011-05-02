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

  def user_first_name
      user_info[:first_name] if user_logged_in?
  end
  
  def user_last_name
      user_info[:last_name] if user_logged_in?
  end
  
  protected
  def comment_attempt_create(controller, on_fail = lambda {})
    if params[:comment] == nil
      redirect_to :controller=>controller, :action=>:view, :id=>params[:id]
      return
    end
    @comment = Comment.new(params[:comment])
    @comment[:user_id] = user_id
    if @comment.save
      flash[:success] = added_successfully_message :comment
      redirect_to :controller=>controller, :action =>:view, :id=>@comment.commentable_id, :anchor=>:comments
    else
      flash.now[:error] = added_unsuccessfully_message :comment
      on_fail.call()
    end
  end
  
  def fb_client
    @client ||= FBGraph::Client.new(:client_id => APP_CONFIG['client_id'],
                                    :secret_id => APP_CONFIG['secret_id'],
                                    :token => session[:access_token])
  end
  
  def twitter_client
    @twitter_client ||= Twitter::Client.new
  end
  
  def twitter_update(str)
    begin
     twitter_client.update(str)
    rescue
     logger.error("failed to post twitter update")
    end
  end
end

class ApplicationController < ActionController::Base
  def initialize
    super()
  end

  def current_user
    if user_logged_in?
      @current_user ||= User.find(session[:user_id])
    else
      {}
    end
  end

  def user_logged_in?
    session[:user_id] != nil
  end

  protected
  def comment_attempt_create(controller, on_fail = lambda {})
    if params[:comment] == nil
      redirect_to :controller=>controller, :action=>:view, :id=>params[:id]
      return
    end
    @comment = Comment.new(params[:comment])
    @comment[:user_id] = current_user.id
    if @comment.save
      flash[:success] = added_successfully_message :comment
      redirect_to :controller=>controller, :action =>:view, :id=>@comment.commentable_id, :anchor=>:comments
    else
      flash.now[:error] = added_unsuccessfully_message :comment
      on_fail.call()
    end
  end

  def twitter_client
    @twitter_client ||= Twitter::Client.new
  end

  def twitter_update(str, hashtag=nil)
    hashtag ||= APP_CONFIG["hashtag"]
    begin
     @tweet = "#{str} ##{hashtag}"[0..139] #twitter restriction of 140 chars
     twitter_client.update(@tweet)
    rescue Exception => e
     logger.error("TWITTER: #{e.message}")
    end
  end
end


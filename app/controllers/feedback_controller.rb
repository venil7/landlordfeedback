class FeedbackController < PageController
  def initialize
    super()
    @own_page = false
  end

  def view
    @feedback = Feedback.find(params[:id])
    @property = Property.find(@feedback.property_id)
    @entrytypes = Entrytype.for_select
    @entry = Entry.new :feedback_id => @feedback.id
    @photo = Photo.new(:feedback_id => @feedback.id)
    @own_page = @feedback.user.id == current_user[:id]
  end

  def add
    if user_logged_in?
      @property = Property.find(params[:id])
      @feedback = Feedback.new(:property_id => @property.id)
    else
      session[:after_login_page] = request.fullpath
      redirect_to :controller => :session, :action => :login
    end
  end

  def create
    if params[:feedback] == nil
      redirect_to :action=>:add, :id=>params[:id]
      return
    end
    @feedback = Feedback.new(params[:feedback])
    @feedback[:user_id] = current_user[:id]
    if @feedback.save
      flash[:success] = added_successfully_message :feedback, :rating
      update_twitter_on_feedback(@feedback)
      redirect_to :controller=>:feedback, :action =>:view, :id=>@feedback.id
    else
      flash.now[:error] = added_unsuccessfully_message :fedback
      @property = Property.find(@feedback[:property_id])
      render :action=>:add
    end
  end

  def entry_create
    if params[:entry] == nil
      redirect_to :action=>:view, :id=>params[:id]
      return
    end
    @entry = Entry.new(params[:entry])
    @entry[:user_id] = current_user[:id]
    if @entry.save
      flash[:success] = added_successfully_message :rating
      redirect_to :action => 'view', :id => @entry.feedback_id, :anchor=>:ratings
      return
    else
      flash.now[:error] = added_unsuccessfully_message :rating
      @feedback = Feedback.find(@entry.feedback_id)
      @property = Property.find(@feedback.property_id)
      @entrytypes = Entrytype.for_select
      @photo = Photo.new(:feedback_id => @feedback.id)
      @own_page = @feedback.user.id == current_user[:id]
      render :action => 'view'
    end
  end

  def comment_create
    comment_attempt_create(:feedback, lambda {
      @feedback = Feedback.find(@comment.commentable_id)
      @property = Property.find(@feedback.property_id)
      @entrytypes = Entrytype.for_select
      @entry = Entry.new :feedback_id => @feedback.id
      @photo = Photo.new(:feedback_id => @feedback.id)
      @own_page = @feedback.user.id == current_user[:id]
      render :action => :view
    })
  end

  private
  def update_twitter_on_feedback(feedback)
    url = url_for(:action=>:view,:controller=>:feedback,:id=>feedback.id,:only_path=>false)
    text = "New feedback added about #{feedback.property.address}, #{url}"
    twitter_update(text)
  end
end


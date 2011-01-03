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
    @own_page = @feedback.user.id == user_id
  end
  
  def add 
    @property = Property.find(params[:id])
    @feedback = Feedback.new(:property_id => @property.id)
  end
  
  def create
    if params[:feedback] == nil
      redirect_to :action=>:add, :id=>params[:id]
      return
    end 
    @feedback = Feedback.new(params[:feedback])
    @feedback[:user_id] = user_id
    if @feedback.save
      flash[:success] = added_successfully_message :feedback, :rating
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
    @entry[:user_id] = user_id
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
      @own_page = @feedback.user.id == user_id
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
      @own_page = @feedback.user.id == user_id
      render :action => :view
    })
  end
end

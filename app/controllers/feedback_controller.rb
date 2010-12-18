class FeedbackController < PageController
  def initialize
    super()
    @comment = Comment.new
    @own_page = false
  end

  def view
    @feedback = Feedback.find(params[:id])
    @property = Property.find(@feedback.property_id)
    @entrytypes = Entrytype.for_select
    @entry = Entry.new :feedback_id => @feedback.id
    @photo = Photo.new(:feedback_id => @feedback.id)
    @comment.feedback_id = @feedback.id
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
      @comment  = Comment.new(:property_id => @property.id)
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
      @comment.feedback_id = @feedback.id
      @photo = Photo.new(:feedback_id => @feedback.id)
      @own_page = @feedback.user.id == user_id
      render :action => 'view'
    end
  end
  
  def comment_create
    if params[:comment] == nil
      redirect_to :action=>:view, :id=>params[:id]
      return
    end
    @comment = Comment.new(params[:comment])
    @comment[:user_id] = user_id
    if @comment.save
      flash[:success] = added_successfully_message :comment
      redirect_to :action => "view", :id => @comment.feedback_id, :anchor => :comments
    else
      flash.now[:error] = added_unsuccessfully_message :comment
      @feedback = Feedback.find(@comment.feedback_id)
      @property = Property.find(@feedback.property_id)
      @entrytypes = Entrytype.for_select
      @entry = Entry.new :feedback_id => @feedback.id
      @photo = Photo.new(:feedback_id => @feedback.id)
      @own_page = @feedback.user.id == user_id
      render :action => 'view'
    end
  end
  
end

class FeedbackController < ApplicationController
  def initialize
    super()
    @comment = Comment.new
  end

  def view
    @feedback = Feedback.find(params[:id])
    @property = Property.find(@feedback[:property_id])
    @entrytypes = Entrytype.for_select
    @entry = Entry.new :feedback_id => @feedback.id
    @comment.feedback_id = @feedback.id
  end
  
  def entry_create
    @entry = Entry.new(params[:entry])
    @entry[:user_id] = user_id
    if @entry.save
      redirect_to :action => 'view', :id => @entry.feedback_id
    else
      @feedback = Feedback.find(@entry.feedback_id)
      @property = Property.find(@feedback.property_id)
      @entrytypes = Entrytype.for_select
      @comment.feedback_id = @feedback.id
      render :action => 'view'
    end
  end
  
  def comment_create
    @comment = Comment.new(params[:comment])
    @comment[:user_id] = user_id
    if @comment.save
      redirect_to :action => "view", :id => @comment.feedback_id
    else
      @feedback = Feedback.find(@comment.feedback_id)
      @property = Property.find(@feedback.property_id)
      @entrytypes = Entrytype.for_select
      @entry = Entry.new :feedback_id => @feedback.id
      render :action => 'view'
    end
  end
end

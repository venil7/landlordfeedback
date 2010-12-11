class PropertyController < ApplicationController

    def add
      @propertytypes = Propertytype.for_select
      @property = Property.new(:lat=>params[:lat], :lng=>params[:lng], :address=>params[:address], :postcode=>params[:postcode])
    end
    
    def create
      @property = Property.new(params[:property])
      @property[:user_id] = user_id
      if @property.save
        redirect_to :controller => "property", :action => "view", :id => @property[:id]
      else
        @propertytypes = Propertytype.for_select
        render :action => 'add'
      end
    end
    
    def view
      @property = Property.find(params[:id])
      @feedback = Feedback.new(:property_id => @property[:id])
      @comment  = Comment.new(:property_id => @property[:id])
      
      #subject to refactoring
      #if @can_upload_images = user_logged_in? && user_id == @property.user_id
      #  @photo = Photo.new(:property_id => @property.id)
      #end
      
    end
    
    def feedback_create
      @feedback = Feedback.new(params[:feedback])
      @feedback[:user_id] = user_id
      if @feedback.save
        redirect_to :action => 'view', :id=>@feedback[:property_id]
      else
        @property = Property.find(@feedback[:property_id])
        @comment  = Comment.new(:property_id => @property[:id])
        render :action=>'view'
      end
    end
    
    def comment_create
      @comment = Comment.new(params[:comment])
      @comment[:user_id] = user_id
      if @comment.save
        redirect_to :action => "view", :id => @comment.property_id
      else
        @property = Property.find(@comment.property_id)
        @feedback = Feedback.new(:property_id => @property[:id])
        render :action=>'view'
      end
  end
end

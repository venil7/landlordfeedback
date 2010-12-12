class AjaxController < ApplicationController
    def props
      @props = Feedbackproperty.for_map_bounds(params)
      render :json => @props
    end
    
    def delete_comment
      @result = default_response
      begin
       @result[:success] = Comment.delete(params[:id]) > 0  
       @result.merge(:message => "deleted")
      rescue Exception => e
       @result.merge(:message => "there was an error deleting comment")
      end
      render :json => @result
    end
    
    def report_comment_abuse
      @result = default_response
      begin
        @comment = Comment.find(params[:id])
        @comment.abuse += 1
        @comment.save
        @result.merge(:success => true, :message => "updated")
      rescue Exception => e
        @result.merge(:message => "there was an error updating comment")
      end
      render :json => @result
    end
    
    def create_feedback_img
      @photo = Photo.new(params[:photo])
      @result = default_response
      if @photo.save
        @result.merge!(success)
      else
        @result.merge!(:message => @photo.errors.full_messages.join(','))
      end
      render :text => @result.to_json
    end
    
    protected
    def default_response
      return { :success => false, :message => String.new }
    end
    
    def success
      return { :success => true }
    end
end

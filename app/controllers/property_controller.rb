class PropertyController < PageController

    def add
      @menu_item = :add_property
      @propertytypes = Propertytype.for_select
      @property = Property.new(:lat=>params[:lat], :lng=>params[:lng], :address=>params[:address], :postcode=>params[:postcode])
    end
    
    def create
      if params[:property] == nil
        redirect_to :action=>:add
        return
      end 
      @menu_item = :add_property
      @property = Property.new(params[:property])
      @property[:user_id] = user_id
      if @property.save
        flash[:success] = added_successfully_message :property, :feedback
        redirect_to :controller => :feedback, :action => :add, :id => @property.id
      else
        flash.now[:error] = added_unsuccessfully_message :property
        @propertytypes = Propertytype.for_select
        render :action => :add
      end
    end
    
    def view
      @property = Property.find(params[:id])
    end
    
    def comment_create
      comment_attempt_create(:property, lambda {
        @property = Property.find(@comment.commentable_id)
        render :action=>:view
      })
    end
end

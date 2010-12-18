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
      @comment  = Comment.new(:property_id => @property.id)
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
        redirect_to :action => :view, :id => @comment.property_id
      else
        flash.now[:error] = added_unsuccessfully_message :comment
        @property = Property.find(@comment.property_id)
        render :action=>:view
      end
  end
end

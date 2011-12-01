class PropertyController < PageController
  def add
    if user_logged_in?
      @menu_item = :add_property
      @propertytypes = Propertytype.for_select
      @property = Property.new(:lat=>params[:lat], :lng=>params[:lng], :address=>params[:address], :postcode=>params[:postcode])
    else
      session[:after_login_page] = request.fullpath
      redirect_to :controller => :session, :action => :login
    end
  end

  def create
    if params[:property] == nil
      redirect_to :action=>:add
      return
    end
    @menu_item = :add_property
    @property = Property.new(params[:property])
    @property[:user_id] = current_user[:id]
    if @property.save
      flash[:success] = added_successfully_message :property, :feedback
      update_twitter_on_property(@property)
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

  private
  def update_twitter_on_property(property)
      url = url_for(:action=>:view,:controller=>:property,:id=>property.id,:only_path=>false)
      text = "New property added #{property.address}, #{url}"
      twitter_update(text)
  end
end


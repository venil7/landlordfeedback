class ManageController < PageController
    before_filter :accessed_by_manager
    
    def index
    end
    
    def posts
        @posts = Post.page(params[:page]).per(page_size)
    end
    def post_edit
        @post = Post.find(params[:id])
    end
    def post_update
        @post = Post.find(params[:id])
        if @post.update_attributes(params[:post])
            flash[:success] = success_message
            redirect_to :action => :posts
        else
            flash[:error] = failed_message
            render :action => :post_edit
        end
    end
    def post_new
        @post = Post.new
    end
    def post_create
        @post = Post.new(params[:post])
        if @post.save
            flash[:success] = success_message
            redirect_to :action => :posts
        else
            flash[:error] = failed_message
            render :action => :post_new
        end
    end
    def post_delete
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = success_message
        redirect_to :action => :posts
    end
    
    def properties
        @properties = Property.page(params[:page]).per(page_size)
    end
    
    def feedbacks
        @feedbacks = Feedback.page(params[:page]).per(page_size)
    end
    
    def comments
        @comments = Comment.page(params[:page]).per(page_size)
    end
    
    def property_delete
        @property = Property.find(params[:id])
        @property.destroy
        flash[:success] = success_message
        redirect_to :action => :properties
    end
    
    def feedback_delete
        @feedback = Feedback.find(params[:id])
        @feedback.destroy
        flash[:success] = success_message
        redirect_to :action => :feedbacks
    end
    
    def comment_delete
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:success] = success_message
        redirect_to :action => :comments        
    end
    
    private 
    def accessed_by_manager
        #for development set manager_alias = 0 - allow everyone
        #for production set manager_alias to managers facebook alias
        redirect_to root_path unless (user_logged_in? and user_alias == APP_CONFIG["manager_alias"]) or APP_CONFIG["manager_alias"].nil?
    end
    
    def success_message
        "success"
    end
    
    def failed_message
        "failure"
    end
    
    def page_size
        20
    end
end

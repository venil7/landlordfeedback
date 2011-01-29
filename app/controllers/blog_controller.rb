class BlogController < PageController
  def initialize
    super()
    get_latest_posts()
  end
  
  
  def view
    @post = Post.find(params[:id])
  end
  
  def comment_create
    comment_attempt_create(:blog, lambda {
      @post = Post.find(params[:id])
      render :action => :view
    })
  end
  
  def get_latest_posts
    @latest_posts = Post.first(3) or []
  end
end

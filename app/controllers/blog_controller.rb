class BlogController < PageController
  def view
    @post = Post.find(params[:id])
  end
  
  def comment_create
    comment_attempt_create(:blog, lambda {
      @post = Post.find(params[:id])
      render :action => :view
    })
  end
end

class BlogController < PageController
  def view
    @post = Post.find(params[:id])
  end
end

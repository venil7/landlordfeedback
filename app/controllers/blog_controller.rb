class BlogController < ApplicationController
  def view
    @post = Post.find(params[:id])
  end
end

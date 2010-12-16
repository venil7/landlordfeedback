class HomeController < ApplicationController

    def index
      @menu_item = :home
      @posts = Post.last(1) or [Post.new]
    end
    
    def about
      @menu_item = :about
      flash.now[:success]="message"
      flash.now[:error]="message"
      flash.now[:notice]="message"
    end
    
    def donate
      @menu_item = :donate
    end
    
    #def index
    #  @user_logged_in = user_logged_in?
    #  @user_id = user_id
    #  @user_name = user_name
    #end
end

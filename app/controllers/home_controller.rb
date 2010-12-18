class HomeController < PageController

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
    
    def search
      redirect_to :action => :index, :anchor => "search=#{params[:term]}"
    end

end

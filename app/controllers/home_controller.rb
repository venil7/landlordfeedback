class HomeController < PageController
    #caches_page :index#[:index, :about, :donate] if Rails.env == "production"
    def index
      @menu_item = :home
      @posts = Post.last(1) or [Post.new]
    end
    
    def about
      @menu_item = :about
    end
    
    def donate
      @menu_item = :donate
    end
    
    def search
      redirect_to :action => :index, :anchor => "search=#{params[:term]}"
    end
end

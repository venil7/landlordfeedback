module ApplicationHelper
    def google_static_map(opts)
      icon = "http://goo.gl/1jfSj"
      opts = {:x => 320, :y => 200, :zoom => 15, :lat => 0, :lng => 0, :attr => {}}.merge(opts.to_hash)
      url = "http://maps.google.com/maps/api/staticmap?center=#{opts[:lat].to_f},#{opts[:lng].to_f}&zoom=#{opts[:zoom].to_i}&size=#{opts[:x].to_i}x#{opts[:y].to_i}&markers=icon:#{icon}|#{opts[:lat].to_f},#{opts[:lng].to_f}&sensor=false"
      raw "<img src='#{url}' width='#{opts[:x].to_i}' height='#{opts[:y].to_i}' />"
    end
    
    def star_rating(opts={})
      result = String.new
      opts = {:max=>5, :rating=>0, :name=>:rating.to_s << rand(100).to_s, :readonly => false}.merge(opts.to_hash)
      opts[:rating] = opts[:max] if opts[:rating] > opts[:max]
      opts[:rating] = 0 if opts[:rating] < 0
      (1..opts[:max].to_i).each { |i|
        result << radio_button_tag(opts[:name], i, opts[:rating] == i, :disabled => opts[:readonly], :class=>:star)
      }
      raw result
    end
    
    def user_widget
      result = String.new
      @user_details = session[:user_info]
      if @user_details
        result << "user: #{@user_details[:name]}"
      else
        @url = url_for :controller=>"auth", :action=>"fblogin"
        result << "<a href='#{@url}'>login via facebook</a>"
      end
      raw result
    end
    
    def user_pic(id)
      return "http://graph.facebook.com/#{id}/picture"
    end
    
    def my_user_pic
      user_pic(@controller.user_alias)
    end
    
    def user_logged_in?
      controller.user_logged_in?
    end
    
    def user_name
      controller.user_name
    end
    
    def fb_login_path
      return {:controller => :auth, :action => :fb_login}
    end
    
    def login_text_link(txt)
      return link_to txt, fb_login_path unless user_logged_in?
    end
end

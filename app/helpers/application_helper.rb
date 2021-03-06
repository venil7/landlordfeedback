module ApplicationHelper
    def google_static_map(opts)
      icon = APP_CONFIG['static_marker_url']
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

    def user_pic(img=nil)
      if img
        img
      else
        current_user[:avatar] ? current_user[:avatar] : "/images/social/anonymous.gif"
      end
    end

   # def my_user_pic
   #   user_pic(controller.user_alias)
   # end

    def user_logged_in?
      controller.user_logged_in?
    end

    def current_user
      controller.current_user
    end

    #def user_name
    #  controller.user_name
    #end

    #def user_first_name
    #  controller.user_first_name
    #end

    #def user_last_name
    #  controller.user_last_name
    #end

    def login_path
      return {:controller => :session, :action => :login}
    end

    def login_text_link(txt)
      return link_to txt, login_path unless user_logged_in?
    end

    def flash_notice
      str = String.new
      flash.each do |category, message|
        str << content_tag(:p, message, :class=>[:flash, category].join(' '))
      end
      return raw str
    end

    def paypal_form
      raw APP_CONFIG['paypal_donate_html'];
    end

    def facebook_link
      raw APP_CONFIG['facebook_link'];
    end

    def twitter_link
      raw APP_CONFIG['twitter_link'];
    end

    def facebook_like
      raw APP_CONFIG['facebook_like'];
    end

    def twitter_tweet
      raw APP_CONFIG['twitter_tweet'];
    end

    def google_buzz
      raw APP_CONFIG['google_buzz'];
    end

    def google_plusone
      raw APP_CONFIG['google_plusone'];
    end

    def google_analytics
      raw APP_TRACKING['google_analytics'];
    end

end


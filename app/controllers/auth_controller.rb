class AuthController < PageController
    attr_reader :redirect_uri
    def fb_callback_uri
      url_for :action=>:fbcallback, :only_path=>false, 
    end
    #redirects to facebook authorization page
    def fb_login
        @last_page = request.referer
        redirect_to fb_client.authorization.authorize_url(:redirect_uri => fb_callback_uri, 
                                                          :scope => 'email, user_photos')
        cookies[:last_page] = @last_page
    end
    #gets called after facebook authorization
    def fbcallback
        @last_page = request.cookies[:last_page.to_s] 
        
        access_token = fb_client.authorization.process_callback(params[:code], :redirect_uri => fb_callback_uri)
        session[:access_token] = access_token
        @user = session[:user_info] = fb_client.selection.me.info!
        
        session[:user_id] = User.add_if_not_present(:alias => @user[:id], :name => @user[:first_name], 
                                                    :surname => @user[:last_name], 
                                                    :email => @user[:email])
        flash[:notice] = "Hi #{@user[:first_name]}, welcome to Landlord Feedback!!"
        #set permanent cokies
        is_returning_user!
        #redirect to where they came from
        redirect_to @last_page ? @last_page : root_path
    end
    
end

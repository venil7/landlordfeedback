class SessionController < PageController
  #create session
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_alias(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to session[:after_login_page] || root_url, :notice => "Hi #{user.name}, welcome to Lanlord Feedback"
    #raise user.to_yaml
    #raise auth.to_yaml
  end

  #present login options here
  def login
    #render view
  end

  #kill session here
  def destroy
    session[:user_id] = nil
    redirect_to request.referrer || root_url, :notice => "You have been signed out!"
  end
end


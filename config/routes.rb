Llfb::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  #root
  root :to => "home#index"

  #map post to blog
  match 'post/view/:id' => "blog#view"

  #adds nice paging to actions mentioned in regexp
  match ":controller/:action/:page", :controller=>"manage", :action => /posts|properties|feedbacks|comments|users/

  #adds omniauth routes
  match "/auth/:provider/callback" => "session#create"
  match "/signout" => "session#destroy", :as => :signout

  #default
  match ":controller(/:action(/:id(.:format)))"

end


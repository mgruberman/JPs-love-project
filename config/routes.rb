OmniauthDeviseExample::Application.routes.draw do |map|

  resources :badges
  resources :barista
  resources :favorite_shops
  resources :image_stores
  resources :reviews
  resources :sharings
  resources :shops
  resources :shop_checkins
  resources :user_locations
  
  map.connect "favorite_shops/activate/:id", :controller => "favorite_shops", :action => "activate"
  map.connect "favorite_shops/deactivate/:id", :controller => "favorite_shops", :action => "deactivate"
  
  map.connect "reviews/activate/:id", :controller => "reviews", :action => "activate"
  map.connect "shops/activate/:id", :controller => "shops", :action => "activate"
  map.connect "reviews/demolish/:id", :controller => "reviews", :action => "demolish"
  map.connect "shops/demolish/:id", :controller => "shops", :action => "demolish"
  map.connect "user_locations/set_default/:id", :controller => "user_locations", :action => "set_default"
  map.connect "image_stores/code_image/:id", :controller => "image_stores", :action => "code_image"
  map.connect "shop_checkin/create/:shop_id", :controller => "shop_checkin", :action => "create"
  map.connect "profiles/subscribe/:id", :controller => "profiles", :action => "subscribe"
  map.connect "profiles/unsubscribe/:id", :controller => "profiles", :action => "unsubscribe"
  map.connect "profiles/friend/:id", :controller => "profiles", :action => "friend"
  map.connect "profiles/unfriend/:id", :controller => "profiles", :action => "unfriend"
    
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => 'registrations'}
  
  root :to => "shops#index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  match '/:id', :controller => 'profiles', :action => 'show', :as => 'profile', :via => :get
end

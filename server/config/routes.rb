Bestmix::Application.routes.draw do
  resources :reviews


  resources :services


  get "my_posts/index"

  get "my_posts/create"

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount Doorkeeper::Engine => '/oauth'

  # accept get method to support scribe-java
  get 'oauth/token' => 'doorkeeper/tokens#create'

  devise_for :users

  namespace :api do
    api_version(:module => "V1", :path => "/v1") do
      resources :posts, :only => [ :index, :show ]
      resources :my_posts, :except => [ :edit ]
      resources :users#, :only => [ :show ]
      resources :reviews
      match 'users/:id/reviews' => 'reviews#reviews_by_user'
      match 'users/:id/services' => 'services#services_by_user'
      resources :services
    end
  end

  match 'users/:id/reviews' => 'reviews#reviews_by_user', :as => :reviews_by_user
  match 'users/:id/services' => 'services#services_by_user', :as => :services_by_user
  resources :my_posts
  resources :users
  match 'users/:id/reviews' => 'reviews#reviews_by_user'
  match 'users/:id/services' => 'services#services_by_user'

  root :to => 'main#index'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

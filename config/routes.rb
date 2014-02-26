Waprik::Application.routes.draw do

  ### Admin resources ###
  namespace :admin do
    resources :videos, :news, :music, :admin_users, :feedbacks, :serials, :series, :categories, :collections
  end

  #### Public resources ###
  scope module: 'public' do
    resources :videos, :serials, :news, :music, :feedbacks, :collections, :categories
  end
  
  # resources :videos, module: "admin"
  # resources :news, module: "admin"
  # resources :music, module: "admin"
  # resources :admin_users, module: "admin"
  # resources :feedbacks, module: "admin"
  # resources :serials, module: "admin" 
  # resources :series, module: "admin" 
  # resources :categories, module: "admin"  

  # ???
  match 'admin/access/:action' => 'admin/access'
  match 'login' => 'admin/access#login'
  match 'admin/news' => 'admin/news#index'
  match 'admin/news/new' => 'admin/news#new'
  match 'admin/logout' => 'admin/access#logout'
  match 'admin' => 'admin/access#menu'

  # resources :videos, module: "public"
  # resources :serials, module: "public"
  # resources :news, module: "public"
  # resources :music, module: "public"
  # resources :feedbacks, module: "public"

  root :to => "public/videos#index"
  ### admin ###

  ### public ###

  # match 'news' => 'public#news'
  # match 'news/:section' => 'public#news'
  match 'news/new' => 'news#new'

  match 'videos' => 'videos#index'
  match 'video/list' => 'public#list'
  match 'test' => 'public/videos#test'
  match 'videos/category/:id' => 'public/videos#category'
  match 'videos/collection/:collection_id' => 'public/videos#collection'
  match 'video' => 'public#videos'
  match 'video/show/:id' => 'public#show'
  match 'serials' => 'public/serials#index'
  # match '/videos/collection' => 'videos#collection'  
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
  match ':controller(/:action(/:id))(.:format)'
end

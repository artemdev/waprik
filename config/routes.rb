require 'sidekiq/web'
Waprik::Application.routes.draw do
  get "music_album/show"

  get "music_alphabet/eng"

  get "music_alphabet/rus"

  # sidekiq
  mount Sidekiq::Web, at: '/tasks'

  # Admin resources
  namespace :admin do
    resources :videos, :news, :music, :admin_users, :feedbacks, :serials, :series, :categories, :collections, :pictures

    resources :films do
      get 'destroy_director', on: :member
      get 'destroy_actor', on: :member
      get 'find', on: :collection
      get 'list', on: :collection
      get 'add_to_favourites', on: :member
      get 'remove_from_favourites', on: :member
    end
    resources :film_files do
      get 'download', on: :member
    end
  end

  # Public resources
    scope module: 'public' do

      resources :videos, :serials, :news, :music, :feedbacks, :collections, :categories, :pictures, :film_genres, :film_actors, :film_directors, :film_treilers
      resources :film_files do
        get 'download'
        get 'part'
      end
      resources :films do
        get "news", on: :collection
      end
      resources :alphabets, except: ['index', 'new', 'create', 'edit', 'update', 'destroy'], controller: "MusicAlphabet" do
        get 'eng', on: :collection
        get 'rus', on: :collection
      end

      resources :tracks, only: ['index', 'show'], controller: "music" do 
        get 'download', on: :member
      end

      resources :artists, only: ['index','show'], controller: "MusicArtists"
      resources :albums, only: ['show'], controller: "MusicAlbums"
    end

  root :to => "public/films#index"

  match 'login' => 'admin/access#login'
  match 'logout' => 'admin/access#logout'
  match 'admin' => 'admin/access#menu'
  match 'admin/access/attempt_login' => 'admin/access#attempt_login'

  ### categories ###
  match 'admin/categories/:id/:content_type' => 'admin/categories#show'
  match 'categories/:id/:content_type' => 'public/categories#show'
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
  match 'pictures/download/:id' => 'public/pictures#download'
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

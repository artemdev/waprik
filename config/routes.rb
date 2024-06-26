require 'sidekiq/web'
Waprik::Application.routes.draw do

  get "static_pages/index"
  
  get 'web', to: 'web/collections#index'

  get 'about_us', to: "static_pages#about_us", as: :about_us
  get 'feedbacks', to: "static_pages#feedbacks", as: :feedbacks
  get 'contacts', to: "static_pages#feedbacks", as: :contacts

  # sidekiq
  mount Sidekiq::Web, at: '/tasks'

  # web
  namespace :web do
    # resources :music
    # resources :films
    resources :collections
    resources :collections, only: [:show, :index] do
      get :films, on: :member
    end
  end

  # Admin resources
  namespace :admin do
    resources :films_collections do
      get 'add_film', on: :member
      get 'add_content', on: :member
    end

    resources :collection_genres do
      get 'fill', on: :member
      get 'find', on: :member
    end
    
    # matches
    match 'music/artists' => "MusicArtists#index"

    resources :music_collections do 
      get 'add_content', on: :member
    end
    
    # resources
    resources :web_collections
    resources :video_formats
    resources :settings, only: :index
    resources :video_qualities
    resources :links
    resources :videos
    resources :news
    resources :music
    resources :users
    resources :feedbacks
    resources :serials
    resources :series
    resources :categories
    resources :collections do
      get 'add_content', on: :member
      get 'refresh', on: :member
      put 'add_film', on: :member
      put 'add_track', on: :member
      post 'remove_from', on: :member
    end
    resources :pictures
    resources :replies, only: ['new', 'create', 'destroy']
    resources :music_artists, controller: "MusicArtists"
    resources :film_qualities
    resources :authentications, only: :index do
      get 'to_vk', on: :collection
      post 'from_vk', on: :collection
    end
    resources :public_pages, only: ['index', 'new', 'create']
    resources :vk_posts, only: ['new', 'create'] do
      post 'get_ero', on: :collection
    end

    resources :ftp_files, only: ['index'] do
      get :rename_films, on: :collection
      get :rename_music, on: :collection
    end
    resources :collections do
      get 'remove_from_collection', on: :member
    end

    resources :feedbacks do
      get 'list', on: :collection
      get 'answer', on: :member
    end

    resources :films do
      resources :qualities, only: ['index','show'] do
        get 'empty', on: :collection
      end
      get 'updating', on: :collection
      get 'thrailers', on: :collection
      get 'new_by_hand', on: :collection
      post 'create_by_hand', on: :collection     
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

    resources :tracks, controller: "Music" do
      collection do
        post 'update_multiple'
        get 'search'
      end
      member do 
        get 'edit_tags'
        put 'update_tags'
        get 'remove_from_collection'
      end
    end
  end

  # Public resources
    match 'film/:id' => 'public/films#show'
    match 'test-dl' => 'public/music#test'
    match 'auth/:provider' => 'public/authentications#create'

    # match "uploads/films/:film_file_id/:filename.:extension", controller: "public/film_files", action: "download", conditions: { method: :get }
    resources :videos
    scope module: 'public' do
      resources :films_collections
      resources :collection_genres
      resources :links, only: 'show'
      resources :subscribtions, only: [:index, :create, :destroy]
      resources :authentications, only: :create
      resources :wishes, only: :new
      resources :users, only: [:new, :create] do 
        get :account, on: :collection
      end
      resources :serials do
        get 'download', on: :member
        get 'get_file', on: :member
      end
      resources :users do
        get 'account', on: :member
      end
      resources :news
      resources :collections do
        get 'join_tracks', on: :member
      end
      resources :categories
      resources :pictures
      resources :film_genres
      resources :film_actors
      resources :film_directors
      resources :film_treilers
      resources :collections
      resources :feedbacks
      resources :artists, only: ['index','show'], controller: "MusicArtists"
      resources :albums, only: ['show'], controller: "MusicAlbums"

      resources :film_files do
        get 'download'
        get 'get_file'
        get 'part'
        get 'get_part'
      end

      resources :music do
        get 'news', on: :collection
        get 'latest', on: :collection
        get 'download', on: :member
        get 'top_mp3', on: :collection
      end

      resources :films do
        get "news", on: :collection
        get "updating", on: :collection
        get 'latest', on: :collection
      end
      match 'films/:id' => 'films#show'

      resources :alphabets, except: ['index', 'new', 'create', 'edit', 'update', 'destroy'], controller: "MusicAlphabet" do
        get 'eng', on: :collection
        get 'rus', on: :collection
      end

      resources :tracks, only: ['index', 'show'], controller: "music" do 
        get 'download', on: :member
      end
    end

  root :to => "public/films#index"

  match 'signin' => 'public/users#new'
  match 'login' => 'admin/access#login'
  match 'logout' => 'admin/access#logout'
  match 'admin' => 'admin/access#menu'
  match 'admin/access/attempt_login' => 'admin/access#attempt_login'
  match 'user/account' => 'public/users#account'
  # categories 
  match 'admin/categories/:id/:content_type' => 'admin/categories#show'
  match 'categories/:id/:content_type' => 'public/categories#show'

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

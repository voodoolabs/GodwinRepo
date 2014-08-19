GodwinRepo::Application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'


  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  resources :users, only: [:show, :new] do
    resources :likes, only: [:index]
    resources :comments, only: [:index]
  end
  get '/search' => 'search#index'
  get '/search/results' => 'search#results'
  get "/signout" => "sessions#destroy", :as => :signout
  get '/auth/:provider/callback', :to => 'sessions#omni_create'
  get '/auth/failure', :to => 'sessions#failure'
  
  resources :posts do
    get 'date'
    resources :likes, only: [:create]
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:show]
  resources :tags, only:[:show]
  resources :sessions, only: [:create, :destroy, :new]

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

Rails.application.routes.draw do

  resources :news do
    collection do
      get 'detail' => 'news#index'
      get 'headlines' => 'news#index_headlines'
      get 'backyard' => 'news#backyard'
      post 'preview' => 'news#preview'
      get 'statistics'
    end
    post 'instruction' => 'news#instruction', on: :member
    post 'like', on: :member
  end

  resources :clubs

  get 'events/past' => 'events#index', :past => true
  resources :events

  resources :websites

  resources :books

  devise_for :users
  resources :users, :only => [:index, :show, :edit, :update] do
    post 'upgrade', on: :member
    post 'downgrade', on: :member
  end
  get 'players/show'
  get 'players/active'

  resources :games, :only => [:index] do
  end
  resources :players, :only => [:show, :index] do
  end

  get 'pages/help'
  get 'updates' => 'activities#index'
  root :to => 'pages#updates'
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get '*path', to: 'application#routing_error'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

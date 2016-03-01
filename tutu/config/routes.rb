Rails.application.routes.draw do
  devise_for :passangers, controllers: {
        sessions: 'passangers/sessions',
        registrations: 'passangers/registrations'
      }

  get 'welcome/index'
  get 'welcome/admin', as: 'admin', path: 'admin'
  root 'searches#show'

  resources :tickets, only: [:index, :show, :new, :create, :destroy]
  resource :search, only: [:new, :show, :edit] do
    member do
      post 'find'
    end
  end

  namespace :admin do
    resources :routes

    resources :passangers
    resources :tickets, only: [:index, :show, :edit, :update, :destroy]

    resources :trains do
      resources :wagons, shallow: true
    end

    resources :railway_stations do
      patch 'change_route_params', on: :member
    end
  end

  resource :search, only: [:new, :show, :edit] do
    post 'find', on: :member
    get 'buy_ticket', on: :member
  end

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

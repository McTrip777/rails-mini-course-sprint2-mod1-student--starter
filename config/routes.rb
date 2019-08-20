Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers
      resources :products, only: [:index, :show]
      resources :orders, only: [:index, :show]

      get "customers/:customer_id/orders", to:"orders#index"
      post "customers/:customer_id/orders", to:"orders#create"
      post "orders/:id/ship", to:"orders#ship"
      get "orders/:order_id/products", to:"orders#index"
      post "orders/:order_id/products", to:"orders#index"
    end
  end
end

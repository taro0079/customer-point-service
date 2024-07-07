Rails.application.routes.draw do
  get 'products/code/:product_code', to: 'products#show_by_code', as: 'product_by_code'
  resources :products
  resources :points
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

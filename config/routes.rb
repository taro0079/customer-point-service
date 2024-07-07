Rails.application.routes.draw do
  get 'products/code/:product_code', to: 'products#show_by_code', as: 'product_by_code'
  resources :products
  post 'points/calculate', to: 'points#calculate', as: 'caclculate_point'

  resources :points
  get 'customers/code/:jancode', to: 'customers#show_by_code', as: 'customer_by_code'
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  resources :rooms do
    resources :messages
  end
  get 'rooms/index'
  root "rooms#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

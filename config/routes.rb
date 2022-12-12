Rails.application.routes.draw do
  resources :users
  get 'user/new'
  get 'messages/create'
  resources :rooms do
    resources :messages
    
  end
  get 'rooms/index'
  root "users#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

Rails.application.routes.draw do
  resources :likes, only: [:index, :create, :destroy]
  resources :matches do 
    resources :chats, only: [:index, :new, :create]
  end
  resources :dogs
  resources :users 
  root 'auth#welcome'
  get 'login', to: 'auth#new'
  post 'login', to: 'auth#create'
  delete '/login', to: 'auth#destroy', as: 'logout'
end

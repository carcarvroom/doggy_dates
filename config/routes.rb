Rails.application.routes.draw do
  resources :likes, only: [:index, :create, :destroy]
  get '/check', to: 'matches#check'
  resources :matches do 
    resources :chats, only: [:new, :create, :show]
  end
  resources :dogs
  resources :users 
  root 'auth#welcome'
  get 'login', to: 'auth#new'
  post 'login', to: 'auth#create'
  delete '/login', to: 'auth#destroy', as: 'logout'
end

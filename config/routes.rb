Rails.application.routes.draw do
  resources :likes
  resources :chats
  resources :matches
  resources :dogs
  get '/signup', to: 'users#new'
  resources :users
  get '/login', to: 'auth#new'
  post '/login', to: 'auth#create'
  delete '/login', to: 'auth#destroy', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

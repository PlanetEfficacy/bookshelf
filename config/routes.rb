Rails.application.routes.draw do
  devise_for :users
  root to: 'reviews#new'
  resources :reviews
  resources :books
  resources :genres
  resources :authors
end

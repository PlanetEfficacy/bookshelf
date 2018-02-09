Rails.application.routes.draw do
  devise_for :users
  root to: 'books#index'
  resources :reviews
  resources :books
  resources :genres
  resources :authors
end

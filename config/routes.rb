Rails.application.routes.draw do
  resources :reviews
  resources :books
  resources :genres
  resources :authors
end

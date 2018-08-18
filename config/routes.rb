Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :authors
    resources :books
    resources :genres
    resources :reviews

    root to: "users#index"
  end

  devise_for :users
  root to: 'admin/books#index'
end

Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  resources :books
  resources :books do
    resources :reviews
  end
  resources :users
  resources :reviews
end

Rails.application.routes.draw do
  devise_for :users
  root 'homepage#index'
  get 'users/show'
  get 'homepage/index'
  resources :wikis
end

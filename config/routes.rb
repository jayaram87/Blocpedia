Rails.application.routes.draw do
  devise_for :users
  root 'wikis#index'
  get 'users/show'
  get 'homepage/index'
  resources :wikis
  resources :charges, only: [:new, :create] do
    collection do 
      put :downgrade_user
    end
  end
  resources :collaborations, only: [:create, :destroy]
end

Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animals do
    resources :favorites, only: [:create, :destroy]
  end
  resource :favorites, only: [:show]
  resources :users, only: [:index, :show]
  root 'animals#index'
end

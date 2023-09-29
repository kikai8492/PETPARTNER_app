Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :animals do
    resources :favorites, only: [:create, :destroy]
    member do
      post 'start_chat'
      delete 'destroy_chat'
    end
  end
  resource :favorites, only: [:show]
  resources :users, only: [:index, :show]
  resources :userinfos, only: [:show]
  root 'animals#index'
  resources :chats, only: [:create, :destroy]
  resources :rooms, only: [:create, :show] do
    member do
      get :suggest_meeting_place
    end
  end
end
